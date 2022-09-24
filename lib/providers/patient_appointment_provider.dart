import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:aartas_design_system/models/confirm_appointment_model.dart';
import 'package:aartas_design_system/models/patient_appointment_list_model.dart';

import 'package:aartas_design_system/models/unconfirmed_appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class PatientAppointmentProvider extends ChangeNotifier {
  List<PatientAppointmentData> _list = [];
  List<PatientAppointmentData> _filteredList = [];

  List<PatientAppointmentData> getList() {
    return _list;
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
    String _message = "(${res.statusCode}) $_url:";
    log(_message);
    if (res.statusCode == 200) {
      final _res = PatientAppointmentResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState == true) {
        _list.clear();
        _list = _res.data!;
        notifyListeners();
      }
      return _res;
    } else {
      log(res.body);
      return PatientAppointmentResponse(message: _message);
    }
  }

  updateFilterAppointments(int _selected) {
    if (_selected == 0) {
      // Upcoming
      _filteredList.clear();
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
      // Completed
      for (var i = 0; i < _list.length; i++) {
        if (_list[i].appointmentStatus == 8 ||
            _list[i].appointmentStatus == 9) {
          _filteredList.add(_list[i]);
          notifyListeners();
        }
      }
    }
    if (_selected == 2) {
      // Previous
      for (var i = 0; i < _list.length; i++) {
        if (_list[i].appointmentStatus == 3) {
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
    print("BUNDLE ID: $bundleId");
    final res = (await http.post(_url, body: {
      "appointment_id": appointmentId,
      "coupon_id": couponId,
      "bundle_id": bundleId != 'null' ? bundleId : "",
      "reward_points": rewardAmount != "null" ? rewardAmount : ""
    }))
        .body;

    log("Network:$res");
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
    return json.decode(res);
  }
}



// Future<PatientAppointment> getPatientsAppointment(
//   String? baseURL,
//   String? patientId,
// ) async {
//   var _url = Uri.parse("$baseURL/patient/all/appointments");
//   String? fileName = "appointments.json";
//   var dir = await getTemporaryDirectory();
//   File file = File(dir.path + "/" + fileName);
//   return checkConn.then((value) async {
//     if (value) {
//       if (file.existsSync()) {
//         // Cached
//         final data = file.readAsStringSync();
//         log("Cached:${json.decode(data)['message']}");
//         return PatientAppointment.fromJson(json.decode(data));
//       } else {
//         // Network
//         final res =
//             (await http.post(_url, body: {"patient_id": patientId})).body;
//         log("Network:${json.decode(res)['message']}");
//         file.writeAsStringSync(res, flush: true, mode: FileMode.write);
//         return PatientAppointment.fromJson(json.decode(res));
//       }
//     } else {
//       // Network
//       final res = (await http.post(_url, body: {"patient_id": patientId})).body;
//       log("Network:${json.decode(res)['message']}");
//       file.writeAsStringSync(res, flush: true, mode: FileMode.write);
//       return PatientAppointment.fromJson(json.decode(res));
//     }
//   });
// }