import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/patient_vitals_trend_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientVitalsTrendProvider extends ChangeNotifier {
  PatientVitalsTrendData _data = PatientVitalsTrendData();

  PatientVitalsTrendData getData() {
    return _data;
  }

  Future<PatientVitalsTrendResponse> fetchData(
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
      var _res = PatientVitalsTrendResponse.fromJson(json.decode(res.body));
      _data = _res.data!;
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return PatientVitalsTrendResponse(message: _message);
    }
  }
}
