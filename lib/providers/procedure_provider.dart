import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/procedure_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProcedureProvider extends ChangeNotifier {
  Future<ProcedureResponse> fetchProcedureList(
    String baseURL,
    String? doctorID,
    String? specialityID,
    String? search,
    String? limit,
    String? offset,
  ) async {
    var _url = Uri.parse("$baseURL/procedure/list");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "speciality_id": specialityID ?? "",
      "search": search ?? "",
      "limit": limit ?? "",
      "offset": offset ?? "",
    });

    String _message =
        "(${res.statusCode}) $_url: doctorID:$doctorID, specialityID:$specialityID, search:$search, limit:$limit, offset:$offset";
    log(_message);
    if (res.statusCode == 200) {
      return ProcedureResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ProcedureResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> saveProcedure(
    String baseURL,
    String? appointmentID,
    String? procedureID,
    String? session,
    String? notes,
    String? oldID,
  ) async {
    var _url = Uri.parse("$baseURL/save/appointment/procedure");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
      "doctor_procedure_id": procedureID ?? "",
      "sessions": session ?? "",
      "notes": notes ?? "",
      "old_id": oldID ?? ""
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

  Future<ResponseModel> saveQuickActionProcedure(
    String baseURL,
    String? doctorQuickActionID,
    String? procedureID,
    String? session,
    String? notes,
    String? oldID,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/save/quickaction/procedure");
    final res = await http.post(_url, body: {
      "doctor_quickaction_id": doctorQuickActionID ?? "",
      "doctor_procedure_id": procedureID ?? "",
      "sessions": session ?? "",
      "notes": notes ?? "",
      "old_id": oldID ?? ""
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

  Future<ResponseModel> removeQuickActionProcedure(
    String baseURL,
    String? id,
  ) async {
    var _url = Uri.parse("$baseURL/delete/doctor/quickaction/procedure");
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

  Future<ResponseModel> addProcedure(
    String baseURL,
    String? title,
  ) async {
    var _url = Uri.parse("$baseURL/add/procedure");
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

  Future<ResponseModel> removeProcedure(
    String baseURL,
    String? id,
  ) async {
    var _url = Uri.parse("$baseURL/remove/procedure");
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
