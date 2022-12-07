import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:aartas_design_system/models/patient_response_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
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

  Future<PatientResponse> fetchData(
    String baseURL,
    String? phoneNumber,
  ) async {
    var _url = Uri.parse("$baseURL/login");
    final res = await http.post(_url, body: {"phone_number": phoneNumber});
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = PatientResponse.fromJson(json.decode(res.body));
      _patientData = _res.data![0];

      notifyListeners();
      return _res;
    } else {
      notifyListeners();
      log(res.body);
      return PatientResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<PatientResponse> fetchList(
    String baseURL,
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
      notifyListeners();
      var _res = PatientResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState == true) {
        _patientList = _res.data!;
        notifyListeners();
      }
      return _res;
    } else {
      notifyListeners();
      log(res.body);
      return PatientResponse(message: "${res.statusCode}");
    }
  }

  List<AppointmentData> _pastVisits = [];

  List<AppointmentData> getPastVisits() {
    return _pastVisits;
  }

  Future<AppointmentResponse> fetchPastVisits(
    String baseURL,
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
      notifyListeners();
      var _res = AppointmentResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState) {
        _pastVisits = _res.data!;
        notifyListeners();
      }
      return _res;
    } else {
      String _message = "";
      log(_message);
      notifyListeners();
      return AppointmentResponse(
        message: json.decode(res.body)['message'],
      );
    }
  }

  Future<ResponseModel> updateProfile(
    String baseURL,
    String? patientID,
    String? fullName,
    String? phoneNumber,
    String? email,
    String? gender,
    String? dob,
    String? relation,
  ) async {
    var _url = Uri.parse("$baseURL/patient/update/profile");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
      "full_name": fullName ?? "",
      "phone_number": phoneNumber ?? "",
      "email": email ?? "",
      "gender": gender ?? "",
      "dob": dob ?? "",
      "relation": relation ?? "",
    });
    log("(${res.statusCode}) $_url");
    if (res.statusCode == 200) {
      notifyListeners();
      var _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      notifyListeners();
      log(res.body);
      return ResponseModel(
        message: "Something went wrong",
      );
    }
  }
}
