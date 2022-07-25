import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppointmentDataProvider extends ChangeNotifier {
  List<AppointmentData> appointmentlist = [];
  bool loading = false;

  List<AppointmentData> getList() {
    return appointmentlist;
  }

  Future<List<AppointmentData>> fetchList(
    String? patientID,
    String? doctorID,
    String? search,
    String? date,
    String? limit,
    String? offset,
    String? type,
  ) async {
    var _url = Uri.parse("$baseURL/clinishare/doctor/appointment/list");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
      "doctor_id": doctorID ?? "",
      "search": search ?? "",
      "date": date ?? "",
      "limit": limit ?? "",
      "offset": offset ?? "",
      "type": type ?? "",
    });
    if (res.statusCode == 200) {
      final _res = AppointmentResponse.fromJson(json.decode(res.body)).data!;
      appointmentlist.clear();
      appointmentlist.addAll(_res);
      notifyListeners();
      return _res;
    } else {
      String _message = "AppointmentApis(List):${res.statusCode}";
      log(_message);
      return AppointmentResponse(message: _message).data!;
    }
  }
}
