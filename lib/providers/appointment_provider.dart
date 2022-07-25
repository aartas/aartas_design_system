import 'package:aartas_design_system/apis/appointment_apis.dart';
import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  AppointmentResponse response = AppointmentResponse();
  List<AppointmentData> appointmentlist = [];
  bool loading = false;

  Future<AppointmentResponse> getResponse() async {
    loading = true;
    return response = await AppointmentApis().getAppointments().then((value) {
      // appointmentlist.clear();
      // loading = false;
      // appointmentlist.addAll(value.data!);
      notifyListeners();
      return value;
    });
  }

  List<AppointmentData> getList() {
    return appointmentlist;
  }

  Future<List<AppointmentData>> fetchList(
    String? patientID,
    String? doctorID,
    String? search,
    String? date,
    String? limit,
    String? offset,
    String? type,
  ) async {
    return AppointmentApis()
        .getList(patientID, doctorID, search, date, limit, offset, type)
        .then(
      (value) {
        _setList(value);
        notifyListeners();
        return value;
      },
    );
  }

  _setList(List<AppointmentData> _list) {
    appointmentlist.clear();
    appointmentlist.addAll(_list);
    notifyListeners();
  }
}
