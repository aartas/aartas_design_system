import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DoctorProvider with ChangeNotifier {
  DoctorData _doctorData = DoctorData();
  List<DoctorData> _list = [];
  List<DoctorData> _recommendedList = [];

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
    bool? showAll,
  ) async {
    var _url = Uri.parse(
        "$baseURL/doctors${showAll != null && showAll ? "?show_all=1" : ""}");
    final res = await http.get(
      _url,
      //  body: {"patient_id": patientID}
    );

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      _list = _res.data!;
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return DoctorResponse(message: json.decode(res.body)['message']);
    }
  }

  List<DoctorData> getRecommendedList() {
    return _recommendedList;
  }

  Future<DoctorResponse> fetchRecommendedList(
    String baseURL,
  ) async {
    var _url = Uri.parse("$baseURL/recommended/doctors");
    final res = await http.post(
      _url,
    );

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      _recommendedList = _res.data!;
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return DoctorResponse(message: json.decode(res.body)['message']);
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
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      _loginTime = DateTime.now();
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      _doctorData = _res.data![0];
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return DoctorResponse(message: json.decode(res.body)['message']);
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
      notifyListeners();
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      notifyListeners();
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<DoctorResponse> fetchData(
      String baseURL, String? patientID, String? doctorID) async {
    var _url = Uri.parse("$baseURL/doctor");
    final res = await http.post(_url,
        body: {"user_id": patientID ?? "", "doctor_id": doctorID ?? ""});
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      _doctorData = _res.data!.first;
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return DoctorResponse(message: json.decode(res.body)['message']);
    }
  }
}
