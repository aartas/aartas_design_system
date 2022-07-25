import 'dart:convert';

import 'package:aartas_design_system/apis/authentication_apis.dart';
import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DoctorDataProvider with ChangeNotifier {
  DoctorData _doctorData = DoctorData();

  DoctorData getData() {
    return _doctorData;
  }

  Future<DoctorResponse> fetchData(String phoneNumber, String passcode) async {
    var _url = Uri.parse("$baseURL/doctor/login");
    final res = await http.post(
      _url,
      body: {
        "phone_number": phoneNumber,
        "passcode": passcode,
      },
    );

    if (res.statusCode == 200) {
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      _doctorData = _res.data![0];
      notifyListeners();
      return _res;
    } else {
      notifyListeners();
      return DoctorResponse(
        message: "${res.statusCode}",
        status: false,
        data: [],
      );
    }
  }

  Future<bool> logout() {
    return AuthenticationProvider().doctorLogout().then((value) {
      _doctorData = DoctorData();
      return Future.value(true);
    });
  }
}
