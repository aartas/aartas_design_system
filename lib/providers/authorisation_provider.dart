import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthorisationProvider with ChangeNotifier {
// Reset Passcode
  Future<ResponseModel> generatePasscode(
    String? baseURL,
    String? phoneNumber,
    String? newPasscode,
    String? reenterPasscode,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/generate/passcode");
    final res = await http.post(_url, body: {
      "phone_number": phoneNumber ?? "",
      "new_passcode": newPasscode ?? "",
      "confirm_passcode": reenterPasscode ?? "",
    });
    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      String _message =
          "AuthorisationProvider(generatePasscode):${res.statusCode}";
      log(_message);
      return ResponseModel(message: _message);
    }
  }

  Future<ResponseModel> updateFcmToken(
    String baseURL,
    String? userID,
    String? token,
    String? location,
    String? latitude,
    String? longitude,
    String? platform,
    String? version,
  ) async {
    var _url = Uri.parse("$baseURL/patient/update/fcm/token");
    if (token != null && token != "") {
      final res = await http.post(_url, body: {
        "user_id": userID,
        "fcm_token": token,
        "location": location,
        "latitude": latitude,
        "longitude": longitude,
        "version": version,
        "platform": platform,
      });
      String _message = "(${res.statusCode}) $_url";
      log(_message);
      if (res.statusCode == 200) {
        return ResponseModel.fromJson(json.decode(res.body));
      } else {
        log(_message);
        return ResponseModel(message: _message);
      }
    } else {
      String _message = "FCM Token is null!";
      log(_message);
      return ResponseModel(message: _message);
    }
  }
}
