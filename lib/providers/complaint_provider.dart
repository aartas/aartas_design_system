import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/complaints_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComplaintProvider extends ChangeNotifier {
  Future<ComplaintsResponse> fetchComplaintList(
    String? doctorID,
    String? specialityID,
    String? search,
  ) async {
    var _url = Uri.parse("$baseURL/complaints/list");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "speciality_id": specialityID ?? "",
      "search": search ?? "",
    });
    String _message =
        "(${res.statusCode}) $_url: doctorID:$doctorID, specialityID:$specialityID, search:$search";
    log(_message);

    if (res.statusCode == 200) {
      return ComplaintsResponse.fromJson(json.decode(res.body));
    }
    return ComplaintsResponse.fromJson(json.decode(res.body));
  }

  Future<ComplaintsResponse> addComplaints(
    String? title,
  ) async {
    var _url = Uri.parse("$baseURL/add/complaints");
    final res = await http.post(_url, body: {
      "title": title ?? "",
    });
    String _message = "(${res.statusCode}) $_url: title:$title";
    log(_message);

    if (res.statusCode == 200) {
      return ComplaintsResponse.fromJson(json.decode(res.body));
    }
    return ComplaintsResponse(message: _message);
  }

  Future<ResponseModel> saveComplaints(
    String? appointmentID,
    String? complaintID,
    String? negativeSymptom,
    String? duration,
    String? durationType,
    String? severity,
    String? progress,
    String? oldID,
    String? notes,
  ) async {
    var _url = Uri.parse("$baseURL/save/complaints");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
      "investigations_id": complaintID ?? "",
      "negative_symptom": negativeSymptom ?? "",
      "duration": duration ?? "",
      "duration_type": durationType ?? "",
      "severity": severity ?? "",
      "progress": progress ?? "",
      "notes": notes ?? "",
      "old_id": oldID ?? "",
    });
    String _message =
        "(${res.statusCode}) $_url: appointmentID:$appointmentID, complaintID:$complaintID, negativeSymptom:$negativeSymptom, duration:$duration, durationType:$durationType,severity:$severity, progress:$progress, notes:$notes, oldID:$oldID";
    log(_message);
    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log("$res");
      return ResponseModel(message: _message);
    }
  }

  Future<ResponseModel> removecomplaint(
    String? id,
  ) async {
    var _url = Uri.parse("$baseURL/remove/complaints");
    final res = await http.post(_url, body: {
      "id": id ?? "",
    });
    String _message = "(${res.statusCode}) $_url: id:$id";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    }
    return ResponseModel(message: _message);
  }
}
