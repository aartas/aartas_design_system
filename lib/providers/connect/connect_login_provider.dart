import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/connect_login_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConnectLoginProvider extends ChangeNotifier {
  ConnectLoginData _userData = ConnectLoginData();

  ConnectLoginData getData() {
    return _userData;
  }

  Future<ConnectLoginResponse> login(
    String baseURL,
    String? email,
    String? password,
    String? fcmToken,
  ) async {
    var _url = Uri.parse("$baseURL/connect/login");
    final res = await http.post(_url, body: {
      "email": email ?? "",
      "password": password ?? "",
      "fcm_token": fcmToken ?? "",
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = ConnectLoginResponse.fromJson(json.decode(res.body));
      _userData = _res.data!;
      notifyListeners();
      return _res;
    } else {
      notifyListeners();
      log(res.body);
      return ConnectLoginResponse(message: json.decode(res.body)['message']);
    }
  }
}
