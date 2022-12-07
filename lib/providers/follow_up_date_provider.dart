import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class FollowUpDateProvider extends ChangeNotifier {
  Future<ResponseModel> saveFollowUp(
    String baseURL,
    String? appointmentID,
    String? followUpDate,
  ) async {
    var _url = Uri.parse("$baseURL/save/followup/date");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
      "followup_date": followUpDate ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }
}
