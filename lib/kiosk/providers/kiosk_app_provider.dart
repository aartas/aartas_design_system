import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/kiosk/models/kiosk_response_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class KioskApiProvider extends ChangeNotifier {
  KioskAppData? data;

  Future<KioskAppResponse?> register(
    String? baseURL,
    String? deviceID,
    String? fcmToken,
  ) async {
    var url = Uri.parse("$baseURL/kiosk/register");

    final res = await http.post(url, body: {
      "device_id": deviceID ?? "",
      "fcm_token": fcmToken ?? "",
    });

    log("(${res.statusCode}) $url");

    if (res.statusCode == 200) {
      var _res = KioskAppResponse.fromJson(json.decode(res.body));
      data = _res.data!;
      notifyListeners();
      return _res;
    } else {
      return null;
    }
  }

  Future<ResponseModel?> sendWhatsappLink(
    String? baseURL,
    String? userId,
    String? purpose,
  ) async {
    var url = Uri.parse("$baseURL/user/send/whatsapp/link");

    final res = await http.post(url, body: {
      "user_id": userId ?? "",
      "purpose": purpose ?? "",
    });

    log("(${res.statusCode}) $url");

    if (res.statusCode == 200) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      return null;
    }
  }
}
