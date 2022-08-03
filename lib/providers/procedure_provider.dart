import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/procedure_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProcedureProvider extends ChangeNotifier {
  Future<ProcedureResponse> fetchProcedureList(
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
      return ProcedureResponse(message: _message);
    }
  }

  Future<ResponseModel> saveProcedure(
    String? appointmentID,
    String? procedureID,
    String? session,
    String? oldID,
  ) async {
    var _url = Uri.parse("$baseURL/save/appointment/procedure");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
      "medicine_id": procedureID ?? "",
      "session": session ?? "",
      "old_id": oldID ?? ""
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: _message);
    }
  }

  Future<ResponseModel> addProcedure(
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
    return ResponseModel(message: _message);
  }

  Future<ResponseModel> removeProcedure(
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
      return ResponseModel(message: _message);
    }
  }
}
