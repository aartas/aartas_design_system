import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/pdf_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PDFProvider extends ChangeNotifier {
  Future<PdfGenerateResponse> generate(
    String? appointmentID,
  ) async {
    var _url = Uri.parse("$baseURL/swift/pdf");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      return PdfGenerateResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return PdfGenerateResponse(message: _message);
    }
  }
}