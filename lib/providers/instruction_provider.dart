import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/response_model.dart';

import 'package:http/http.dart' as http;

class NotesProvider {
  Future<ResponseModel> saveNote(
    String? appointmentID,
    String? note,
  ) async {
    var _url = Uri.parse("$baseURL/save/appointment/instructions");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
      "note": note ?? "",
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
}
