import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientVitalsTrendProvider extends ChangeNotifier {
  ResponseModel _data = ResponseModel();

  ResponseModel getData() {
    return _data;
  }

  bool _isLoading = false;
  bool isLoading() {
    return _isLoading;
  }

  Future<ResponseModel> fetchData(
    String baseURL,
    String? patientId,
  ) async {
    _isLoading = true;
    notifyListeners();
    var _url = Uri.parse("$baseURL/patient/vitals/trend");
    final res = await http.post(_url, body: {
      "patient_id": patientId,
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      _isLoading = false;
      notifyListeners();
      var _res = ResponseModel.fromJson(json.decode(res.body));
      _data = _res;
      notifyListeners();
      return _res;
    } else {
      _isLoading = false;
      notifyListeners();
      log(res.body);
      return ResponseModel(message: _message);
    }
  }
}
