import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthorizationProvider with ChangeNotifier {
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
      notifyListeners();
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      String _message =
          "AuthorizationProvider(generatePasscode):${res.statusCode}";
      log(_message);
      notifyListeners();
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  // Future<ResponseModel> saveUnregisteredUser(
  //   String? baseURL,
  //   String? fcmToken,
  //   String? deviceID,
  // ) async {
  //   var _url = Uri.parse("$baseURL/save/unregistered/user");
  //   final res = await http.post(_url, body: {
  //     "fcm_token": fcmToken ?? "",
  //     "device_id": deviceID ?? "",
  //   });
  //   if (res.statusCode == 200) {
  //     notifyListeners();
  //     return ResponseModel.fromJson(json.decode(res.body));
  //   } else {
  //     String _message =
  //         "AuthorizationProvider(generatePasscode):${res.statusCode}";
  //     log(_message);
  //     notifyListeners();
  //     return ResponseModel(message: json.decode(res.body)['message']);
  //   }
  // }

  Future<ResponseModel?>? saveUnregisteredUser(
    String? baseURL,
    String? fcmToken,
    String? deviceID,
  ) async {
    var _url = Uri.parse("$baseURL/save/unregistered/user");
    final res = await http.post(_url, body: {
      "fcm_token": fcmToken ?? "",
      "device_id": deviceID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      final _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return Future.value();
    }
  }

  Future<ResponseModel?>? updateFcmToken(
    String baseURL,
    String? userID,
    String? token,
    String? platform,
    String? version,
    String? deviceID,
  ) async {
    var _url = Uri.parse("$baseURL/patient/update/fcm/token");
    if (token != null && token != "" && token != "null") {
      final res = await http.post(_url, body: {
        "user_id": userID,
        "fcm_token": token,
        "version": version,
        "platform": platform,
        "device_id": deviceID,
      });
      String _message = "(${res.statusCode}) $_url";
      log(_message);
      if (res.statusCode == 200) {
        notifyListeners();
        return ResponseModel.fromJson(json.decode(res.body));
      } else {
        log(_message);
        return ResponseModel(message: json.decode(res.body)['message']);
      }
    } else {
      String _message = "FCMToken is null!";
      log(_message);
      notifyListeners();
      return ResponseModel(message: _message);
    }
  }
}
