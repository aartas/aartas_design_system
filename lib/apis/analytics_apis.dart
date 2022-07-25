import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:http/http.dart' as http;

class AnalyticsApis {
  captureEvent(
    String? patientID,
    String? doctorID,
    String? specialityID,
    String? appointmentID,
    String? homeFeedID,
    String? event,
  ) async {
    var _url = Uri.parse("$baseURL/patient/history/add");
    final res = await http.post(
      _url,
      body: {
        "patient_id": patientID ?? "",
        "doctor_id": doctorID ?? "",
        "appointment_id": appointmentID ?? "",
        "speciality_id": specialityID ?? "",
        "home_feed_id": homeFeedID ?? "",
        "event": event ?? "",
      },
    );
    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      String _message = "Analytics(Capture Event):${res.statusCode}";
      log(_message);
      return ResponseModel(message: _message);
    }
  }
}
