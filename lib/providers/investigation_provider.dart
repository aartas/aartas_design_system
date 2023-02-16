import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/investigation_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InvestigationProvider extends ChangeNotifier {
  Future<InvestigationsResponse> fetchInvestigationList(
    String baseURL,
    String? doctorID,
    String? specialityID,
    String? search,
    String? limit,
    String? offset,
  ) async {
    var _url = Uri.parse("$baseURL/investigations/list");
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
      return InvestigationsResponse.fromJson(json.decode(res.body));
    }
    return InvestigationsResponse(message: json.decode(res.body)['message']);
  }

  Future<ResponseModel> addInvestigation(
    String baseURL,
    String? title,
  ) async {
    var _url = Uri.parse("$baseURL/add/investigations");
    final res = await http.post(_url, body: {
      "title": title ?? "",
    });
    String _message = "(${res.statusCode}) $_url: title:$title";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    }
    return ResponseModel(message: json.decode(res.body)['message']);
  }

  Future<ResponseModel> saveInvestigation(
    String baseURL,
    String? appointmentID,
    String? investigationID,
    String? fastingState,
    String? duration,
    String? durationType,
    String? notes,
    String? results,
    String? oldID,
  ) async {
    var _url = Uri.parse("$baseURL/save/investigations");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
      "investigations_id": investigationID ?? "",
      "fasting_state": fastingState ?? "",
      "duration": duration ?? "",
      "duration_type": durationType ?? "",
      "notes": notes ?? "",
      "results": results ?? "",
      "old_id": oldID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    }
    return ResponseModel(message: json.decode(res.body)['message']);
  }

  Future<ResponseModel> saveQuickActionInvestigation(
    String baseURL,
    String? doctorQuickActionID,
    String? investigationID,
    String? fastingState,
    String? duration,
    String? durationType,
    String? notes,
    String? results,
    String? oldID,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/save/quickaction/investigation");
    final res = await http.post(_url, body: {
      "doctor_quickaction_id": doctorQuickActionID ?? "",
      "investigations_id": investigationID ?? "",
      "fasting_state": fastingState ?? "",
      "duration": duration ?? "",
      "duration_type": durationType ?? "",
      "notes": notes ?? "",
      "results": results ?? "",
      "old_id": oldID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    }
    return ResponseModel(message: json.decode(res.body)['message']);
  }

  Future<ResponseModel> removeInvestigation(
    String baseURL,
    String? id,
  ) async {
    var _url = Uri.parse("$baseURL/remove/investigations");
    final res = await http.post(_url, body: {
      "id": id ?? "",
    });
    String _message = "(${res.statusCode}) $_url: id:$id";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    }
    return ResponseModel(message: json.decode(res.body)['message']);
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
