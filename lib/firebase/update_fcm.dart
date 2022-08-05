import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

Future<ResponseModel> updateFcmToken(
  String baseURL,
  String? userID,
  String? token,
  String? location,
  String? latitude,
  String? longitude,
) async {
  var _url = Uri.parse("$baseURL/patient/update/fcm/token");
  PackageInfo _packageInfo = await PackageInfo.fromPlatform();
  String? _platform = Platform.operatingSystem;
  if (token != null && token != "") {
    final res = await http.post(_url, body: {
      "user_id": userID,
      "fcm_token": token,
      "location": location,
      "latitude": latitude,
      "longitude": longitude,
      "version": _packageInfo.version,
      "platform": _platform,
    });
    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      String _message = "Update FCM Token:${res.statusCode}";
      log(_message);
      return ResponseModel(message: _message);
    }
  } else {
    String _message = "FCM Token is null!";
    return ResponseModel(message: _message);
  }
}
