import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConsultationProvider extends ChangeNotifier {
  Future<ResponseModel> startTime(
    String baseURL,
    String? appointmentId,
  ) async {
    var _url = Uri.parse("$baseURL/appointment/start/consultation/time");
    final res = await http.post(_url, body: {
      "patient_id": appointmentId,
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return ResponseModel(message: _message);
    }
  }

  Future<ResponseModel> endTime(
    String baseURL,
    String? appointmentId,
  ) async {
    var _url = Uri.parse("$baseURL/appointment/end/consultation/time");
    final res = await http.post(_url, body: {
      "patient_id": appointmentId,
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return ResponseModel(message: _message);
    }
  }
}
