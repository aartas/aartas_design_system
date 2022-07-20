import 'package:aartas_design_system/apis/appointment_apis.dart';
import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  AppointmentResponse _result = AppointmentResponse();
  bool loading = false;

  getResponse() async {
    loading = true;
    _result = await AppointmentApis().getAppointments();
    loading = false;
    notifyListeners();
  }
}
