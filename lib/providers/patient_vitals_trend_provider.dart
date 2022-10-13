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

  Future<ResponseModel> fetchData(
    String baseURL,
    String? patientId,
  ) async {
    var _url = Uri.parse("$baseURL/patient/vitals/trend");
    final res = await http.post(_url, body: {
      "patient_id": patientId,
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      _data = _res;
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      return ResponseModel(message: _message);
    }
  }
}
