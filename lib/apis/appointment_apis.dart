import 'dart:convert';
import 'dart:io';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class AppointmentProvider extends ChangeNotifier {
  final List<AppointmentData> _appointmentList = [];
  List<AppointmentData> get appointmentList => _appointmentList;

  Future<List<AppointmentData>> getAppointments() async {
    var _url = Uri.parse("$baseURL/clinishare/doctor/appointment/list");
    var dir = await getTemporaryDirectory();
    File _file = File(dir.path + "/" + doctorDetailsFileName);

    final doctorID =
        DoctorResponse.fromJson(json.decode(_file.readAsStringSync()))
            .data![0]
            .id;

    final res = (await http.post(_url, body: {"doctor_id": "$doctorID"})).body;
    _appointmentList
        .addAll(AppointmentResponse.fromJson(json.decode(res)).data!);
    print("LENGTH: ${_appointmentList.length}");
    notifyListeners();
    return _appointmentList;
  }

  final List<AppointmentData> _previousAppointmentList = [];
  List<AppointmentData> get previousAppointmentList => _appointmentList;
  Future<List<AppointmentData>> getPatientPreviousAppointment(
      String patientId) async {
    var dir = await getTemporaryDirectory();
    File _file = File(dir.path + "/" + doctorDetailsFileName);
    var _url = Uri.parse("$baseURL/clinishare/get/patient/past/visits");

    final doctorID =
        DoctorResponse.fromJson(json.decode(_file.readAsStringSync()))
            .data![0]
            .id;

    final res = (await http.post(_url, body: {
      "doctor_id": "$doctorID",
      "patient_id": patientId,
    }))
        .body;
    _previousAppointmentList
        .addAll(AppointmentResponse.fromJson(json.decode(res)).data!);
    notifyListeners();
    return _previousAppointmentList;
  }
}
