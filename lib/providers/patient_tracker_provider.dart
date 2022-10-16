import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/checkinQRCode_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientTrackerProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool isLoading() {
    return _isLoading;
  }

  Future<CheckinQRCodeResponse> scanQR(
    String baseURL,
    String? patientID,
    String? locationID,
  ) async {
    _isLoading = true;
    notifyListeners();
    var _url = Uri.parse("$baseURL/patient/qr/scan");
    final res = await http.post(_url, body: {
      "patient_id": patientID,
      "location_id": locationID,
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      _isLoading = false;
      notifyListeners();
      var _res = CheckinQRCodeResponse.fromJson(json.decode(res.body));
      return _res;
    } else {
      _isLoading = false;
      notifyListeners();
      log(res.body);
      return CheckinQRCodeResponse(message: _message);
    }
  }

  Future<ResponseModel> checkIn(
    String baseURL,
    String? patientID,
    String? locationID,
  ) async {
    _isLoading = true;
    notifyListeners();
    var _url = Uri.parse("$baseURL/patient/check/in");
    final res = await http.post(_url, body: {
      "patient_id": patientID,
      "location_id": locationID,
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      _isLoading = false;
      notifyListeners();
      var _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      _isLoading = false;
      notifyListeners();
      log(res.body);
      return ResponseModel(message: _message);
    }
  }

  Future<ResponseModel> checkOut(
    String baseURL,
    String? patientID,
    String? locationID,
  ) async {
    _isLoading = true;
    notifyListeners();
    var _url = Uri.parse("$baseURL/patient/check/in");
    final res = await http.post(_url, body: {
      "patient_id": patientID,
      "location_id": locationID,
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      _isLoading = false;
      notifyListeners();
      var _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      _isLoading = false;
      notifyListeners();
      log(res.body);
      return ResponseModel(message: _message);
    }
  }
}
