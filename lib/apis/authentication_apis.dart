import 'dart:async';
import 'dart:convert';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:aartas_design_system/models/patient_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthenticationProvider extends ChangeNotifier {
  // --------------- DOCTOR AUTHENTICATION PROVIDER -------------
  DoctorDetails _doctorDetails = DoctorDetails();
  DoctorDetails get doctorDetails => _doctorDetails;

  Future<DoctorDetails> doctorLogin(String phoneNumber, String passcode) async {
    var _url = Uri.parse("$baseURL/doctor/login");
    final res = await http.post(
      _url,
      body: {
        "phone_number": phoneNumber,
        "passcode": passcode,
      },
    );
    if (res.statusCode == 200) {
      _doctorDetails = DoctorDetails.fromJson(json.decode(res.body));
      notifyListeners();
      return _doctorDetails;
    } else {
      notifyListeners();
      return DoctorDetails(
        message: "${res.statusCode}",
        status: false,
        data: [],
      );
    }
  }

  // --------------- DOCTOR AUTHENTICATION PROVIDER -------------

  // --------------- PATIENT AUTHENTICATION PROVIDER -------------
  PatientData _patientData = PatientData();
  get patientData => _patientData;

  // --------------- PATIENT AUTHENTICATION PROVIDER -------------
}
