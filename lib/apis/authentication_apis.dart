import 'dart:async';
import 'dart:convert';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

// --------------- AUTHENTICATION PROVIDER --------------
class AuthenticationProvider extends ChangeNotifier {
  // --------------- DOCTOR AUTH PROVIDER --------------
  late SharedPreferences _sharedPreferences;
  DoctorResponse _doctorDetails = DoctorResponse();
  DoctorResponse get doctorDetails => _doctorDetails;

  Future<DoctorResponse> doctorLogin(
      String phoneNumber, String passcode) async {
    var _url = Uri.parse("$baseURL/doctor/login");
    final res = await http.post(
      _url,
      body: {
        "phone_number": phoneNumber,
        "passcode": passcode,
      },
    );
    if (res.statusCode == 200) {
      _doctorDetails = DoctorResponse.fromJson(json.decode(res.body));
      _sharedPreferences.setString(doctorDetailsKey, res.body);
      notifyListeners();
      return _doctorDetails;
    } else {
      notifyListeners();
      return DoctorResponse(
        message: "${res.statusCode}",
        status: false,
        data: [],
      );
    }
  }

  Future<bool> doctorLogout() async {
    return await _sharedPreferences.remove(doctorDetailsKey);
  }

  // --------------- DOCTOR AUTH PROVIDER -------------

  // --------------- PATIENT AUTHENTICATION PROVIDER -------------

  // --------------- PATIENT AUTHENTICATION PROVIDER -------------
}

// --------------- AUTHENTICATION PROVIDER --------------