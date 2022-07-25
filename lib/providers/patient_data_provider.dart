import 'package:aartas_design_system/apis/authentication_apis.dart';
import 'package:aartas_design_system/models/patient_response_model.dart';
import 'package:flutter/material.dart';

class PatientDataProvider with ChangeNotifier {
  PatientData _patientData = PatientData();
  List<PatientData> _patientList = [];

  PatientData getData() {
    return _patientData;
  }

  _setData(PatientData val) {
    _patientData = val;
    notifyListeners();
  }

  Future<PatientData> fetchData(String? phoneNumber) {
    return AuthenticationProvider().patientLogin(phoneNumber!).then((value) {
      _setData(value.data![0]);
      notifyListeners();
      return value.data![0];
    });
  }

  // Future<List<PatientData>> fetchData(){
  //   return
  // }

}
