import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/quick_actions_notes_models.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

// doctor/save/quickaction/notes
// get/doctor/quickaction/notes
// add/quickaction/notes/in/appointments
// delete/doctor/quickaction/notes

class NotesProvider extends ChangeNotifier {
  Future<ResponseModel> saveNote(
    String baseURL,
    String? appointmentID,
    String? note,
    String? oldID,
  ) async {
    var _url = Uri.parse("$baseURL/save/appointment/instructions");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
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

  Future<ResponseModel> addQuickActionNotesInAppointment(
    String baseURL,
    String? doctorQuickActionID,
    String? appointmentID,
  ) async {
    var _url = Uri.parse("$baseURL/add/quickaction/notes/in/appointments");
    final res = await http.post(_url, body: {
      "doctor_quickaction_id": doctorQuickActionID ?? "",
      "appointment_id": appointmentID ?? "",
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

  Future<ResponseModel> doctorSaveQuickActionNotes(
    String baseURL,
    String? doctorQuickActionID,
    String? notes,
    String? oldID,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/save/quickaction/notes");
    final res = await http.post(_url, body: {
      "doctor_quickaction_id": doctorQuickActionID ?? "",
      "notes": notes ?? "",
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

  Future<QuickActionNotesResponse?> getDoctorQuickactionNotes(
    String baseURL,
    String? doctorID,
  ) async {
    var _url = Uri.parse("$baseURL/get/doctor/quickaction/notes");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      return QuickActionNotesResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return null;
    }
  }
}
