import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/address_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CallNurseProvider extends ChangeNotifier {
  Future<ResponseModel> callNurse(
    String baseURL,
    String? doctorID,
    String? clinicID,
  ) async {
    var _url = Uri.parse("$baseURL/call/nurse");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "clinic_id": clinicID,
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      notifyListeners();
      log(res.body);
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }
}
