import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppointmentListProvider extends ChangeNotifier {
  List<AppointmentData> appointmentlist = [];
  bool loading = false;

  List<AppointmentData> getList() {
    return appointmentlist;
  }

  Future<AppointmentResponse> fetchList(
    String? patientID,
    String? doctorID,
    String? search,
    String? date,
    String? limit,
    String? offset,
    String? type,
    bool? manageState,
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
      final _res = AppointmentResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState == true) {
        appointmentlist.clear();
        appointmentlist.addAll(_res.data!);
        notifyListeners();
      }
      return _res;
    } else {
      String _message = "AppointmentDataProvider:${res.statusCode}";
      log(_message);
      return AppointmentResponse(message: _message);
    }
  }
}
