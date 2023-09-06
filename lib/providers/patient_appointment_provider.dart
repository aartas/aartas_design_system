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

  Future<PatientAppointmentResponse?> fetchData(
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
      return null;
    }
  }

  Future<PatientAppointmentResponse?> fetchList(
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
        notifyListeners();
        updateFilterAppointments(0);
      }
      return _res;
    } else {
      log(res.body);
      return null;
    }
  }

  updateFilterAppointments(int _selected) {
    List<PatientAppointmentData> tempList = [..._list];
    _filteredList.clear();
    if (_selected == 0) {
      // Upcoming
      for (var i = 0; i < tempList.length; i++) {
        if (tempList[i].appointmentStatus != 1 &&
            tempList[i].appointmentStatus != 3 &&
            tempList[i].appointmentStatus != 8 &&
            tempList[i].appointmentStatus != 9) {
          _filteredList.add(tempList[i]);
          notifyListeners();
        }
      }
    }
    if (_selected == 1) {
      // Completed , Payment Done, Cancelled
      for (var i = 0; i < tempList.length; i++) {
        if (tempList[i].appointmentStatus == 8 ||
            tempList[i].appointmentStatus == 9 ||
            tempList[i].appointmentStatus == 3) {
          _filteredList.add(tempList[i]);
          notifyListeners();
        }
      }
    }
  }

  Future<UnconfirmedAppointment?> unconfirmedAppointment(
    String? baseURL,
    String? patientId,
    String? doctorId,
    String? slotId,
  ) async {
    var _url = Uri.parse("$baseURL/book/appointment");
    log("Unconfirm Appointment: $patientId, $doctorId, $slotId");
    final res = await http.post(_url, body: {
      "doctor_id": doctorId,
      "patient_id": patientId,
      "timeslot_id": slotId,
    });
    String _message = "(${res.statusCode}) $_url:";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      final _res = UnconfirmedAppointment.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      return null;
    }
  }

  Future<ConfirmAppointment?> confirmedAppointment(
    String? baseURL,
    String? appointmentId,
    String? couponId,
    String? bundleId,
    String? rewardAmount,
    int? getAppointmentLink, // 1: Send Link, 0: Don't Send Link
  ) async {
    var _url = Uri.parse("$baseURL/confirm/appointment");
    // print("BUNDLE ID: $bundleId");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentId,
      "coupon_id": couponId,
      "bundle_id": bundleId != 'null' ? bundleId : "",
      "redeem_points": rewardAmount != "null" ? rewardAmount : "",
      "get_appointment_link": getAppointmentLink ?? 0,
    });
    String _message = "(${res.statusCode}) $_url:";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      final _res = ConfirmAppointment.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      return null;
    }
  }

  Future<ResponseModel?> rescheduleAppointment(
    String? baseURL,
    String? appointmentId,
    String? timeslotId,
  ) async {
    var _url = Uri.parse("$baseURL/reschedule/appointment");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentId,
      "timeslot_id": timeslotId,
    });
    String _message = "(${res.statusCode}) $_url:";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      final _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      return null;
    }
  }

  Future<ResponseModel?> cancelAppointment(
    String? baseURL,
    String? appointmentId,
  ) async {
    var _url = Uri.parse("$baseURL/cancel/appointment");
    final res = await http.post(
      _url,
      body: {"appointment_id": appointmentId ?? ""},
    );
    String _message = "(${res.statusCode}) $_url:";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      final _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      return null;
    }
  }

  Future<PatientAheadResponse> getPatientsAhead(
    String baseUrl,
    String? appointmentID,
  ) async {
    var _url = Uri.parse("$baseUrl/appointment/get/patient/ahead");
    final res =
        await http.post(_url, body: {"appointment_id": appointmentID ?? ""});
    String _message = "(${res.statusCode}) $_url:";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      final _res = PatientAheadResponse.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return PatientAheadResponse(message: json.decode(res.body)['message']);
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
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }
}
