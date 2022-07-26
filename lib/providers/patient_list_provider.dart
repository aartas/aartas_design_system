import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/patient_response_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PatientDataListProvider with ChangeNotifier {
  List<PatientData> _patientList = [];

  List<PatientData> getList() {
    return _patientList;
  }

  Future<PatientResponse> fetchList(
    String doctorID,
    String search,
    String limit,
    String offset,
    bool? manageState,
  ) async {
    var _url = Uri.parse("$baseURL/patient/list");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID,
      "search": search,
      "limit": limit,
      "offset": offset,
    });

    if (res.statusCode == 200) {
      var _res = PatientResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState == true) {
        _patientList = _res.data!;
        notifyListeners();
      }
      return _res;
    } else {
      String _message = "DoctorListProvider:${res.statusCode}";
      log(_message);
      return PatientResponse(message: "${res.statusCode}");
    }
  }
}


//  Future<ResponseModel> getList(
//     String url,
//     String search,
//     String doctorId,
//     String specialityId,
//     int? limit,
//     int? offset,
//   ) async {
//     var _url = Uri.parse(url);
//     final res = (await http.post(_url, body: {
//       "doctor_id": doctorId,
//       "search": search,
//       "limit": limit ?? "",
//       "offset": offset ?? "",
//     }))
//         .body;
//     return ResponseModel(
//       message: json.decode(res)['message'],
//       data: json.decode(res)['data'],
//     );
//   }