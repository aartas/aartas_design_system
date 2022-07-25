import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DoctorDataListProvider with ChangeNotifier {
  List<DoctorData> _doctorList = [];

  List<DoctorData> getData() {
    return _doctorList;
  }

  Future<DoctorResponse> fetchData(String patientID, bool? manageState) async {
    var _url = Uri.parse("$baseURL/doctors");
    final res = await http.post(_url, body: {"patient_id": patientID});

    if (res.statusCode == 200) {
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState == true) {
        _doctorList = _res.data!;
        notifyListeners();
      }
      return _res;
    } else {
      String _message = "DoctorListProvider:${res.statusCode}";
      log(_message);
      return DoctorResponse(message: "${res.statusCode}");
    }
  }
}
