import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/diagnosis_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DiagnosisProvder extends ChangeNotifier {
  Future<DiagnosisResponse> fetchDaignosisList(
    String? doctorID,
    String? specialityID,
    String? search,
  ) async {
    var _url = Uri.parse("$baseURL/diagnosis/list");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "speciality_id": specialityID ?? "",
      "search": search ?? "",
    });
    String _message =
        "(${res.statusCode}) $_url: doctorID:$doctorID, specialityID:$specialityID, search:$search";
    log(_message);

    if (res.statusCode == 200) {
      return DiagnosisResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return DiagnosisResponse(message: _message);
    }
  }

  Future<DiagnosisResponse> addDiagnosis(
    String? title,
  ) async {
    var _url = Uri.parse("$baseURL/add/diagnosis");
    final res = await http.post(_url, body: {
      "title": title ?? "",
    });
    String _message = "(${res.statusCode}) $_url: title:$title";
    log(_message);

    if (res.statusCode == 200) {
      return DiagnosisResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return DiagnosisResponse(message: _message);
    }
  }

  Future<ResponseModel> saveDiagnosis(
    String? appointmentID,
    String? diagnosisID,
    String? duration,
    String? durationType,
    String? diagnosisStatus,
    String? medication,
    String? oldID,
  ) async {
    var _url = Uri.parse("$baseURL/save/diagnosis");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
      "diagnosis_id": diagnosisID ?? "",
      "duration": duration ?? "",
      "duration_type": durationType ?? "",
      "diagnosis_status": diagnosisStatus ?? "",
      "medication": medication ?? "",
      "old_id": oldID ?? "",
    });
    String _message =
        "(${res.statusCode}) $_url: appointmentID:$appointmentID, diagnosisID:$diagnosisID, duration:$duration, durationType:$durationType, diagnosisStatus:$diagnosisStatus, medication:$medication, oldID:$oldID";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: _message);
    }
  }

  Future<ResponseModel> removeDiagnosis(
    String? id,
  ) async {
    var _url = Uri.parse("$baseURL/remove/diagnosis");
    final res = await http.post(_url, body: {
      "id": id ?? "",
    });
    String _message = "(${res.statusCode}) $_url: id:$id";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: _message);
    }
  }
}
