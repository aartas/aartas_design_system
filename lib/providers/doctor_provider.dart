import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DoctorProvider with ChangeNotifier {
  DoctorData _doctorData = DoctorData();
  List<DoctorData> _list = [];

  DateTime _loginTime = DateTime.now();

  DateTime sessionTime() {
    return _loginTime;
  }

  DoctorData getData() {
    return _doctorData;
  }

  List<DoctorData> getList() {
    return _list;
  }

  Future<DoctorResponse> fetchList(
    String baseURL,
    String patientID,
  ) async {
    var _url = Uri.parse("$baseURL/doctors");
    final res = await http.post(_url, body: {"patient_id": patientID});

    if (res.statusCode == 200) {
      var _res = DoctorResponse.fromJson(json.decode(res.body));

      _list = _res.data!;
      notifyListeners();

      return _res;
    } else {
      String _message = "DoctorListProvider:${res.statusCode}";
      log(_message);
      return DoctorResponse(message: "${res.statusCode}");
    }
  }

  Future<DoctorResponse> login(
    String baseURL,
    String phoneNumber,
    String passcode,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/login");
    final res = await http
        .post(_url, body: {"phone_number": phoneNumber, "passcode": passcode});
    String _message = "(${res.statusCode})";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      _loginTime = DateTime.now();
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      _doctorData = _res.data![0];
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      return DoctorResponse(message: _message);
    }
  }

  Future<ResponseModel> logout(
    String baseURL,
    String? doctorID,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/logout");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: _message);
    }
  }
}
