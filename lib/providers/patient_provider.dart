import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/apis/authentication_apis.dart';
import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:aartas_design_system/models/patient_response_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PatientProvider with ChangeNotifier {
  PatientData _patientData = PatientData();
  List<PatientData> _patientList = [];

  PatientData getData() {
    return _patientData;
  }

  List<PatientData> getList() {
    return _patientList;
  }

  // final List<PatientData> _patientList = [];

  Future<PatientData> fetchData(String? phoneNumber) {
    return AuthenticationProvider().patientLogin(phoneNumber!).then((value) {
      _patientData = value.data![0];
      notifyListeners();
      return value.data![0];
    });
  }

  Future<PatientResponse> fetchList(
    String? doctorID,
    String? search,
    String? limit,
    String? offset,
    bool? manageState,
  ) async {
    var _url = Uri.parse("$baseURL/patient/list");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "search": search ?? "",
      "limit": limit ?? "",
      "offset": offset ?? "",
    });

    if (res.statusCode == 200) {
      var _res = PatientResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState == true) {
        _patientList = _res.data!;
        notifyListeners();
      }
      return _res;
    } else {
      String _message = "PatientListProvider:${res.statusCode}";
      log(_message);
      return PatientResponse(message: "${res.statusCode}");
    }
  }

  List<AppointmentData> _pastVisits = [];

  List<AppointmentData> getPastVisits() {
    return _pastVisits;
  }

  Future<AppointmentResponse> pastVisits(
    String? patientID,
    String? doctorID,
    String? limit,
    String? offset,
    bool? manageState,
  ) async {
    var _url = Uri.parse("$baseURL/clinishare/get/patient/past/visits");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
      "doctor_id": doctorID ?? "",
      "limit": limit ?? "",
      "offset": offset ?? "",
    });
    if (res.statusCode == 200) {
      var _res = AppointmentResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState) {
        _pastVisits = _res.data!;
        notifyListeners();
      }
      return _res;
    } else {
      String _message = "";
      log(_message);
      return AppointmentResponse(
        message: _message,
      );
    }
  }
}


//  Future<ResponseModel> getList(
//     String url,
//     String search,
//     String doctorId,
//     String specialityId,
//     int? limit,
//     int? offset,
//   ) async {
//     var _url = Uri.parse(url);
//     final res = (await http.post(_url, body: {
//       "doctor_id": doctorId,
//       "search": search,
//       "limit": limit ?? "",
//       "offset": offset ?? "",
//     }))
//         .body;
//     return ResponseModel(
//       message: json.decode(res)['message'],
//       data: json.decode(res)['data'],
//     );
//   }