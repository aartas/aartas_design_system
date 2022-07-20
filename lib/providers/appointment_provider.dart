import 'package:aartas_design_system/apis/appointment_apis.dart';
import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  AppointmentResponse response = AppointmentResponse();
  List<AppointmentData> list = [];
  bool loading = false;

  Future<AppointmentResponse> getResponse() async {
    loading = true;
    return response = await AppointmentApis().getAppointments().then((value) {
      list.clear();
      loading = false;
      list.addAll(value.data!);
      notifyListeners();
      return value;
    });
  }
}
