import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
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

  Future<AppointmentResponse> fetchList(
    String baseUrl,
    String? patientID,
    String? doctorID,
    String? search,
    String? date,
    String? limit,
    String? offset,
    String? type,
    bool? manageState,
  ) async {
    var _url = Uri.parse("$baseUrl/clinishare/doctor/appointment/list");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
      "doctor_id": doctorID ?? "",
      "search": search ?? "",
      "date": date ?? "",
      "limit": limit ?? "",
      "offset": offset ?? "",
      "type": type ?? "",
    });
    String _message = "(${res.statusCode}) $_url:";
    log(_message);
    if (res.statusCode == 200) {
      final _res = AppointmentResponse.fromJson(json.decode(res.body));
      notifyListeners();
      if (manageState == null || manageState == true) {
        _list.clear();
        _list = _res.data!;
        notifyListeners();
      }
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return AppointmentResponse(message: json.decode(res.body)['message']);
    }
  }

  AppointmentResponse _appointmentData = AppointmentResponse();

  Future<AppointmentResponse> fetchData(
    String? baseURL,
    String? appointmentID,
  ) async {
    var _url = Uri.parse("$baseURL/appointment/details");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      final _res = AppointmentResponse.fromJson(json.decode(res.body));
      _appointmentData = _res;
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return AppointmentResponse(message: json.decode(res.body)['message']);
    }
  }

  AppointmentResponse getAppointmentData() {
    return _appointmentData;
  }

  Future<ResponseModel> appointmentCallIn(
    String? baseURL,
    String? appointmentID,
  ) async {
    var _url = Uri.parse("$baseURL/appointment/call/in");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      final _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> startConsultation(
    String? baseURL,
    String? appointmentID,
  ) async {
    var _url = Uri.parse("$baseURL/appointment/start/consultation/time");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      final _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> endConsultation(
    String? baseURL,
    String? appointmentID,
  ) async {
    var _url = Uri.parse("$baseURL/appointment/end/consultation/time");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      final _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }
}
