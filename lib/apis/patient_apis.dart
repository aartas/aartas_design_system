import 'dart:convert';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientApis extends ChangeNotifier {
  Future<Response> getList(
    String url,
    String search,
    String doctorId,
    String specialityId,
    int limit,
    int offset,
  ) async {
    var _url = Uri.parse(url);
    final res = (await http.post(_url)).body;
    return Response(
      message: json.decode(res)['message'],
      data: json.decode(res)['data'],
    );
  }
}
