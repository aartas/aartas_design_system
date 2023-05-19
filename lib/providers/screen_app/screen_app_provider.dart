import 'dart:convert';
import 'dart:developer';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:aartas_design_system/models/screen_app/screen_app_response_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class ScreenAppProvider with ChangeNotifier {
  Future<ScreenAppResponse?> registerScreenDevice(
    String baseURL,
    String? title,
    String? deviceID,
    String? clinicID,
    String? roomID,
    String? fcmToken,
    String? batteryPercentage,
  ) async {
    var _url = Uri.parse("$baseURL/door/device/save");
    final res = await http.post(
      _url,
      body: {
        "title": title ?? "",
        "device_id": deviceID ?? "",
        "location_id": clinicID ?? "",
        "room_id": roomID ?? "",
        "fcm_token": fcmToken ?? "",
        "battery_percentage": batteryPercentage ?? "",
      },
    );

    log("(${res.statusCode}) $_url");

    if (res.statusCode == 200) {
      return ScreenAppResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return null;
    }
  }

  Future<ResponseModel?> sendBatteryNotification(
    String baseURL,
    String? deviceID,
  ) async {
    var _url = Uri.parse("$baseURL/door/device/send/battery/notification");
    final res = await http.post(
      _url,
      body: {
        "device_id": deviceID ?? "",
      },
    );

    log("(${res.statusCode}) $_url");

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return null;
    }
  }
}
