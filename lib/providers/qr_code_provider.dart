import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientTrackerProvider extends ChangeNotifier {
  Future<ResponseModel> scanQR(
    String baseURL,
    String? patientID,
    String? locationID,
  ) async {
    var _url = Uri.parse("$baseURL/patient/qr/scan");
    final res = await http.post(_url, body: {
      "patient_id": patientID,
      "location_id": locationID,
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      return ResponseModel(message: _message);
    }
  }

  Future<ResponseModel> checkIn(
    String baseURL,
    String? patientID,
    String? locationID,
  ) async {
    var _url = Uri.parse("$baseURL/patient/check/in");
    final res = await http.post(_url, body: {
      "patient_id": patientID,
      "location_id": locationID,
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      return ResponseModel(message: _message);
    }
  }

  Future<ResponseModel> checkOut(
    String baseURL,
    String? patientID,
    String? locationID,
  ) async {
    var _url = Uri.parse("$baseURL/patient/check/in");
    final res = await http.post(_url, body: {
      "patient_id": patientID,
      "location_id": locationID,
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      return ResponseModel(message: _message);
    }
  }
}
