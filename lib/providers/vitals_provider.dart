import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/patient_vitals_model.dart';
import 'package:aartas_design_system/models/vitals_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VitalsProvider with ChangeNotifier {
  List<Vital> _vitals = [];

  List<Vital> getVitalList() {
    return _vitals;
  }

  Future<VitalsResponse> fetchVitalList(bool? manageState) async {
    var _url = Uri.parse("$baseURL/vitals/list");
    final res = await http.post(_url);
    if (res.statusCode == 200) {
      if (manageState == null && manageState == true) {
        _vitals.clear();
        _vitals = VitalsResponse.fromJson(json.decode(res.body)).data!.vitals!;
        notifyListeners();
      }
      return VitalsResponse.fromJson(json.decode(res.body));
    } else {
      String _message = "VitalsProvider(getVitalsList):${res.statusCode}";
      log(_message);
      return VitalsResponse(message: _message);
    }
  }

  List<Vital> _patientList = [];
  List<Vital> getPatientVitalsList() {
    return _patientList;
  }

  Future<VitalsResponse> fetchPatientVitalList(
      String? appointmentID, bool? manageState) async {
    var _url = Uri.parse("$baseURL/appointment/vitals/list");
    final res = await http.post(_url);
    if (res.statusCode == 200) {
      if (manageState == null && manageState == true) {
        _patientList.clear();
        _patientList =
            VitalsResponse.fromJson(json.decode(res.body)).data!.vitals!;
        notifyListeners();
      }
      return VitalsResponse.fromJson(json.decode(res.body));
    } else {
      String _message =
          "VitalsProvider(getPatientVitalsList):${res.statusCode}";
      log(_message);
      return VitalsResponse(message: _message);
    }
  }
}
