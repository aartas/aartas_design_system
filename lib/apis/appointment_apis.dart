import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/apis/authentication_apis.dart';
import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AppointmentProvider extends ChangeNotifier {
  AppointmentResponse _appointmentResponse = AppointmentResponse();
  AppointmentResponse get appointmentResponse => _appointmentResponse;

  Future<AppointmentResponse> getAppointments() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    var _url = Uri.parse("$baseURL/clinishare/doctor/appointment/list");
    var _id = DoctorResponse.fromJson(
      json.decode(_prefs.getString(doctorDetailsKey)!),
    ).data![0].id;

    final res = (await http.post(_url, body: {"doctor_id": "$_id"})).body;
    _appointmentResponse = AppointmentResponse.fromJson(json.decode(res));
    return _appointmentResponse;
  }

//   Future<AppointmentResponse> patientPastAppointment(String patientId) async {
//     SharedPreferences _prefs = await SharedPreferences.getInstance();
//     var _url = Uri.parse("$baseURL/clinishare/get/patient/past/visits");
//     var _details = _prefs.getString("details");
//     final res = (await http.post(_url, body: {
//       "patient_id": patientId,
//       "doctor_id":
//           "${DoctorResponse.fromJson(json.decode(_details.toString())).data![0].id}"
//     }))
//         .body;
//     return AppointmentResponse.fromJson(json.decode(res));
//   }
}
