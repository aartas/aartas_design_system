import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:http/http.dart' as http;

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
