import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/apis/authentication_apis.dart';
import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DoctorProvider with ChangeNotifier {
  DoctorData _doctorData = DoctorData();
  List<DoctorData> _list = [];

  DoctorData getData() {
    return _doctorData;
  }

  List<DoctorData> getList() {
    return _list;
  }

  Future<DoctorResponse> fetchList(String patientID, bool? manageState) async {
    var _url = Uri.parse("$baseURL/doctors");
    final res = await http.post(_url, body: {"patient_id": patientID});

    if (res.statusCode == 200) {
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState) {
        _list = _res.data!;
        notifyListeners();
      }
      return _res;
    } else {
      String _message = "DoctorListProvider:${res.statusCode}";
      log(_message);
      return DoctorResponse(message: "${res.statusCode}");
    }
  }

  Future<DoctorResponse> fetchData(
      String phoneNumber, String passcode, bool? manageState) async {
    var _url = Uri.parse("$baseURL/doctor/login");
    final res = await http
        .post(_url, body: {"phone_number": phoneNumber, "passcode": passcode});

    if (res.statusCode == 200) {
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState == true) {
        _doctorData = _res.data![0];
        notifyListeners();
      }
      return _res;
    } else {
      String _message = "DoctorDataProvider:${res.statusCode}";
      log(_message);
      return DoctorResponse(message: _message);
    }
  }

  Future<bool> logout() {
    return AuthenticationProvider().doctorLogout().then((value) {
      _doctorData = DoctorData();
      return Future.value(true);
    });
  }
}
