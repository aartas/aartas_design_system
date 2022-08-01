import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppointmentProvider extends ChangeNotifier {
  final AppointmentData _data = AppointmentData();
  List<AppointmentData> _list = [];

  AppointmentData getData() {
    return _data;
  }

  List<AppointmentData> getList() {
    return _list;
  }

  // Future<AppointmentResponse> fetchData(){}

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
    String _message =
        "(${res.statusCode}) $_url: patientID:$patientID, doctorID:$doctorID, search:$search, date:$date, limit:$limit, offset:$offset, type:$type";
    log(_message);
    if (res.statusCode == 200) {
      final _res = AppointmentResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState == true) {
        _list.clear();
        _list = _res.data!;
        notifyListeners();
      }
      return _res;
    }

    return AppointmentResponse(message: _message);
  }

  AppointmentResponse _appointmentData = AppointmentResponse();

  Future<AppointmentResponse> fetchAppointmentData(
    String? appointmentID,
  ) async {
    var _url = Uri.parse("$baseURL/appointment/details");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      final _res = AppointmentResponse.fromJson(json.decode(res.body));
      _appointmentData = _res;
      notifyListeners();
      return _res;
    }
    return AppointmentResponse(message: _message);
  }

  AppointmentResponse getAppointmentData() {
    return _appointmentData;
  }
}
