import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/kiosk_models/kiosk_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class KioskApiProvider extends ChangeNotifier {
  KioskAppData? data;

  KioskAppData? getData() {
    return data;
  }

  Future<KioskAppResponse?> register(
    String? baseURL,
    String? deviceID,
    String? fcmToken,
  ) async {
    var url = Uri.parse("$baseURL/kiosk/register");

    final res = await http.get(url);
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
}
