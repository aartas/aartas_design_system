import 'dart:convert';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientProvider extends ChangeNotifier {
  Future<Response> getList(
    String url,
    String search,
    String doctorId,
    String specialityId,
    int? limit,
    int? offset,
  ) async {
    var _url = Uri.parse(url);
    final res = (await http.post(_url, body: {
      "doctor_id": doctorId,
      "search": search,
      "limit": limit ?? "",
      "offset": offset ?? "",
    }))
        .body;
    return Response(
      message: json.decode(res)['message'],
      data: json.decode(res)['data'],
    );
  }
}
