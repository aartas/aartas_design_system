import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/add_category_response_model.dart';
import 'package:aartas_design_system/models/diagnosis_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DiagnosisProvder extends ChangeNotifier {
  Future<DiagnosisResponse> fetchDaignosisList(
    String baseURL,
    String? doctorID,
    String? specialityID,
    String? search,
    String? limit,
    String? offset,
  ) async {
    var _url = Uri.parse("$baseURL/diagnosis/list");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "speciality_id": specialityID ?? "",
      "search": search ?? "",
      "limit": limit ?? "",
      "offset": offset ?? "",
    });
    String _message =
        "(${res.statusCode}) $_url: doctorID:$doctorID, specialityID:$specialityID, search:$search";
    log(_message);

    if (res.statusCode == 200) {
      return DiagnosisResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return DiagnosisResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<AddCategoryResponse> addDiagnosis(
    String baseURL,
    String? title,
  ) async {
    var _url = Uri.parse("$baseURL/add/diagnosis");
    final res = await http.post(_url, body: {
      "title": title ?? "",
    });
    String _message = "(${res.statusCode}) $_url: title:$title";
    log(_message);

    if (res.statusCode == 200) {
      return AddCategoryResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return AddCategoryResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> saveDiagnosis(
    String baseURL,
    String? appointmentID,
    String? diagnosisID,
    String? duration,
    String? durationType,
    String? diagnosisStatus,
    String? medication,
    String? note,
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
      "note": note ?? "",
      "old_id": oldID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> addQuickActionDiagnosis(
    String baseURL,
    String? doctorQuickActionID,
    String? diagnosisID,
    String? duration,
    String? durationType,
    String? diagnosisStatus,
    String? medication,
    String? oldID,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/save/quickaction/diagnosis");
    final res = await http.post(_url, body: {
      "doctor_quickaction_id": doctorQuickActionID ?? "",
      "diagnosis_id": diagnosisID ?? "",
      "duration": duration ?? "",
      "duration_type": durationType ?? "",
      "diagnosis_status": diagnosisStatus ?? "",
      "medication": medication ?? "",
      "old_id": oldID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> removeQuickActionDiagnosis(
    String baseURL,
    String? id,
  ) async {
    var _url = Uri.parse("$baseURL/delete/doctor/quickaction/diagnosis");
    final res = await http.post(_url, body: {
      "id": id ?? "",
    });
    String _message = "(${res.statusCode}) $_url: id:$id";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> removeDiagnosis(
    String baseURL,
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
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> fetchQuickActionList(String baseURL) async {
    var _url = Uri.parse("$baseURL/quick/action/list");
    final res = await http.post(_url);
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> addQuickActionValue(
    String baseURL,
    String? appointmenID,
    String? quickActionID,
  ) async {
    var _url = Uri.parse("$baseURL/quick/action/add");
    final res = await http.post(_url);
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }
}
