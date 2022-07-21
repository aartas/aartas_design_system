import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:aartas_design_system/models/patient_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

// --------------- AUTHENTICATION PROVIDER --------------
class AuthenticationProvider extends ChangeNotifier {
  // --------------- DOCTOR AUTH PROVIDER --------------
  DoctorResponse _doctorResponse = DoctorResponse();
  DoctorResponse get doctorResponse => _doctorResponse;

  Future<DoctorResponse> doctorLogin(
      String phoneNumber, String passcode) async {
    var dir = await getTemporaryDirectory();
    File _file = File(dir.path + "/" + doctorDetailsFileName);

    var _url = Uri.parse("$baseURL/doctor/login");
    final res = await http.post(
      _url,
      body: {
        "phone_number": phoneNumber,
        "passcode": passcode,
      },
    );

    if (res.statusCode == 200) {
      _doctorResponse = DoctorResponse.fromJson(json.decode(res.body));
      _file.writeAsStringSync(res.body, flush: true, mode: FileMode.write);
      notifyListeners();
      return _doctorResponse;
    } else {
      notifyListeners();
      return DoctorResponse(
        message: "${res.statusCode}",
        status: false,
        data: [],
      );
    }
  }

  Future<void> doctorLogout() async {
    var dir = await getTemporaryDirectory();
    File _file = File(dir.path + "/" + doctorDetailsFileName);
    return _file.deleteSync();
  }

  // --------------- DOCTOR AUTH PROVIDER -------------

  // --------------- PATIENT AUTHENTICATION PROVIDER -------------

  PatientResponse _patientResponse = PatientResponse();

  Future<PatientResponse> patientLogin(String phoneNumber) async {
    // var dir = await getTemporaryDirectory();
    // File _file = File(dir.path + "/" + patientDetailsFileName);

    var _url = Uri.parse("$baseURL/login");
    final res = await http.post(
      _url,
      body: {
        "phone_number": phoneNumber,
      },
    );

    if (res.statusCode == 200) {
      _patientResponse = PatientResponse.fromJson(json.decode(res.body));
      await getDir(patientDetailsFileName)
          .writeAsStringSync(res.body, flush: true, mode: FileMode.write);
      notifyListeners();
      return _patientResponse;
    } else {
      notifyListeners();
      return PatientResponse(
        message: "${res.statusCode}",
        status: false,
        data: [],
      );
    }
  }

  Future<void> patientLogout() async {
    return await getDir(patientDetailsFileName).deleteSync();
  }
  // --------------- PATIENT AUTHENTICATION PROVIDER -------------
}

// --------------- AUTHENTICATION PROVIDER --------------