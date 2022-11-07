import 'dart:convert';
import 'dart:developer';
import 'package:aartas_design_system/models/confirm_appointment_model.dart';
import 'package:aartas_design_system/models/patient_ahead_model.dart';
import 'package:aartas_design_system/models/patient_appointment_list_model.dart';
import 'package:aartas_design_system/models/response_model.dart';

import 'package:aartas_design_system/models/unconfirmed_appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientAppointmentProvider extends ChangeNotifier {
  PatientAppointmentData _data = PatientAppointmentData();
  List<PatientAppointmentData> _list = [];
  final List<PatientAppointmentData> _filteredList = [];
  PatientAppointmentData getData() {
    return _data;
  }

  List<PatientAppointmentData> getList() {
    return _list;
  }

  List<PatientAppointmentData> getFilteredList() {
    return _filteredList;
  }

  Future<PatientAppointmentResponse> fetchData(
    String baseUrl,
    String? appointmentID,
  ) async {
    var _url = Uri.parse("$baseUrl/appointment/$appointmentID");
    final res = await http.get(_url);
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      final _res = PatientAppointmentResponse.fromJson(
        json.decode(res.body),
      );
      _data = _res.data!.first;
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return PatientAppointmentResponse(message: _message);
    }
  }

  Future<PatientAppointmentResponse> fetchList(
    String baseUrl,
    String? patientID,
    String? doctorID,
    String? search,
    String? date,
    String? limit,
    String? offset,
    String? type,
    bool? manageState,
  ) async {
    var _url = Uri.parse("$baseUrl/patient/all/appointments");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
      "doctor_id": doctorID ?? "",
      "search": search ?? "",
      "date": date ?? "",
      "limit": limit ?? "",
      "offset": offset ?? "",
      "type": type ?? "",
    });
    notifyListeners();
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      final _res = PatientAppointmentResponse.fromJson(
        json.decode(res.body),
      );
      if (manageState == null || manageState == true) {
        _list.clear();
        _list = _res.data!;
        updateFilterAppointments(0);
      }
      return _res;
    } else {
      log(res.body);

      return PatientAppointmentResponse(message: _message);
    }
  }

  updateFilterAppointments(int _selected) {
    _filteredList.clear();
    if (_selected == 0) {
      // Upcoming
      for (var i = 0; i < _list.length; i++) {
        if (_list[i].appointmentStatus != 1 &&
            _list[i].appointmentStatus != 3 &&
            _list[i].appointmentStatus != 8 &&
            _list[i].appointmentStatus != 9) {
          _filteredList.add(_list[i]);
          notifyListeners();
        }
      }
    }
    if (_selected == 1) {
      // Completed , Payment Done, Cancelled
      for (var i = 0; i < _list.length; i++) {
        if (_list[i].appointmentStatus == 8 ||
            _list[i].appointmentStatus == 9 ||
            _list[i].appointmentStatus == 3) {
          _filteredList.add(_list[i]);
          notifyListeners();
        }
      }
    }
  }

  Future<UnconfirmedAppointment> unconfirmedAppointment(
    String? baseURL,
    String? patientId,
    String? doctorId,
    String? slotId,
  ) async {
    var _url = Uri.parse("$baseURL/book/appointment");
    log("Unconfirm Appointment: $patientId, $doctorId, $slotId");
    final res = (await http.post(_url, body: {
      "doctor_id": doctorId,
      "patient_id": patientId,
      "timeslot_id": slotId
    }))
        .body;
    log("Network:${json.decode(res)['message']}");
    notifyListeners();
    return UnconfirmedAppointment.fromJson(json.decode(res));
  }

  Future<ConfirmAppointment> confirmedAppointment(
    String? baseURL,
    String? appointmentId,
    String? couponId,
    String? bundleId,
    String? rewardAmount,
  ) async {
    var _url = Uri.parse("$baseURL/confirm/appointment");
    // print("BUNDLE ID: $bundleId");
    final res = (await http.post(_url, body: {
      "appointment_id": appointmentId,
      "coupon_id": couponId,
      "bundle_id": bundleId != 'null' ? bundleId : "",
      "redeem_points": rewardAmount != "null" ? rewardAmount : ""
    }))
        .body;

    log("Network:$res");
    notifyListeners();
    return ConfirmAppointment.fromJson(json.decode(res));
  }

  Future rescheduleAppointment(
    String? baseURL,
    String? appointmentId,
    String? timeslotId,
  ) async {
    var _url = Uri.parse("$baseURL/reschedule/appointment");
    final res = (await http.post(
      _url,
      body: {
        "appointment_id": appointmentId,
        "timeslot_id": timeslotId,
      },
    ))
        .body;
    log("Network:${json.decode(res)['message']}");
    notifyListeners();
    return json.decode(res);
  }

  Future cancelAppointment(
    String? baseURL,
    String? appointmentId,
  ) async {
    var _url = Uri.parse("$baseURL/cancel/appointment");
    final res = (await http.post(
      _url,
      body: {
        "appointment_id": appointmentId ?? "",
      },
    ))
        .body;
    log("Network:${json.decode(res)['message']}");
    notifyListeners();
    return json.decode(res);
  }

  Future<PatientAheadResponse> getPatientsAhead(
    String baseUrl,
    String? appointmentID,
  ) async {
    var _url = Uri.parse("$baseUrl/appointment/get/patient/ahead");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
    });
    String _message = "(${res.statusCode}) $_url:";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      final _res = PatientAheadResponse.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return PatientAheadResponse(message: _message);
    }
  }

  Future<ResponseModel> confirmArrival(
    String baseUrl,
    String? appointmentID,
  ) async {
    var _url = Uri.parse("$baseUrl/appointment/confirm/arrival");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
    });
    String _message = "(${res.statusCode}) $_url:";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      final _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return ResponseModel(message: _message);
    }
  }
}
