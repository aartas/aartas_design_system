import 'package:aartas_design_system/apis/authentication_apis.dart';
import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:flutter/material.dart';

class DoctorDataProvider with ChangeNotifier {
  DoctorData _doctorData = DoctorData();

  DoctorData getData() {
    return _doctorData;
  }

  _setData(DoctorData value) {
    _doctorData = value;
    notifyListeners();
  }

  Future<DoctorResponse> fetchData(String phoneNumber, String passcode) {
    return AuthenticationProvider().doctorLogin(phoneNumber, passcode).then(
      (value) {
        _setData(value.data![0]);
        notifyListeners();
        return value;
      },
    );
  }
}
