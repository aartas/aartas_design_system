import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:aartas_design_system/models/patient_response_model.dart';
import 'package:aartas_design_system/models/search_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchProvider extends ChangeNotifier {
  List<AppointmentData> _appointmentList = [];
  List<PatientData> _patientList = [];
  List<DoctorData> _doctorList = [];

  Future<SearchResponse> fetchSearchResults(
    String baseURL,
    String? doctorID,
    String? search,
    String? offset,
    String? limit,
  ) async {
    var _url = Uri.parse("$baseURL/global/search");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "search": search ?? "",
      "offset": offset ?? "",
      "limit": limit ?? "",
    });
    String _message = "(${res.statusCode}) $_url:";
    log(_message);
    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      notifyListeners();
      _appointmentList.clear();
      _patientList.clear();
      _doctorList.clear();
      _appointmentList =
          SearchResponse.fromJson(json.decode(res.body)).data!.appointments!;
      _patientList =
          SearchResponse.fromJson(json.decode(res.body)).data!.patients!;
      _doctorList =
          SearchResponse.fromJson(json.decode(res.body)).data!.doctors!;
      return SearchResponse.fromJson(json.decode(res.body));
    } else {
      notifyListeners();
      log(res.body);
      return SearchResponse(message: json.decode(res.body)['message']);
    }
  }
}
