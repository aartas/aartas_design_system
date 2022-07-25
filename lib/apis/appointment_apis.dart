import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:aartas_design_system/models/doctor_model.dart';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class AppointmentApis {
  AppointmentResponse _appointmentResponse = AppointmentResponse();
  AppointmentResponse get appointmentList => _appointmentResponse;

  Future<AppointmentResponse> getAppointments() async {
    var _url = Uri.parse("$baseURL/clinishare/doctor/appointment/list");
    var dir = await getTemporaryDirectory();
    File _file = File(dir.path + "/" + doctorDetailsFileName);

    final doctorID =
        DoctorResponse.fromJson(json.decode(_file.readAsStringSync()))
            .data![0]
            .id;

    final res = (await http.post(_url, body: {"doctor_id": "$doctorID"})).body;
    _appointmentResponse = AppointmentResponse.fromJson(json.decode(res));

    return _appointmentResponse;
  }

  AppointmentResponse _previousAppointmentList = AppointmentResponse();
  AppointmentResponse get previousAppointmentList => _previousAppointmentList;
  Future<AppointmentResponse> getPatientPreviousAppointment(
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
    _previousAppointmentList = AppointmentResponse.fromJson(json.decode(res));

    return _previousAppointmentList;
  }

  Future<List<AppointmentData>> getList(
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
      return _res;
    } else {
      String _message = "AppointmentApis(getList):${res.statusCode}";
      log(_message);
      return AppointmentResponse(message: _message).data!;
    }
  }

  Future<List<AppointmentData>> getPreviousAppointmentList(
    String? patientID,
    String? doctorID,
  ) async {
    var _url = Uri.parse("$baseURL/clinishare/get/patient/past/visits");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "patient_id": patientID ?? "",
    });

    if (res.statusCode == 200) {
      return AppointmentResponse.fromJson(json.decode(res.body)).data!;
    } else {
      String _message =
          "AppointmentApis(previousAppointments):${res.statusCode}";
      log(_message);
      return AppointmentResponse(message: _message).data!;
    }
  }
}
