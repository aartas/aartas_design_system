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
    String? passcode,
  ) async {
    var _url = Uri.parse("$baseURL/connect/login");
    final res = await http.post(_url, body: {
      "email": email ?? "",
      "passcode": passcode ?? "",
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
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
