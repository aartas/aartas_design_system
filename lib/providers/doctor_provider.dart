import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/doctor_check_in_out_model.dart';
import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:aartas_design_system/models/doctor_timeslots_model.dart';
import 'package:aartas_design_system/models/latest_timeslot_model.dart';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:aartas_design_system/models/speciality_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class DoctorProvider with ChangeNotifier {
  DoctorData _doctorData = DoctorData();
  List<DoctorData> _list = [];
  List<DoctorData> _recommendedList = [];
  List<DoctorData> todaysList = [];

  List<Speciality> specialityList = [];

  DateTime _loginTime = DateTime.now();

  DateTime sessionTime() {
    return _loginTime;
  }

  DoctorData getData() {
    return _doctorData;
  }

  List<DoctorData> getList() {
    return _list;
  }

  Future<DoctorResponse> fetchList(
    String baseURL,
    String? patientID,
    String? locationID,
    bool? showAll,
  ) async {
    var _url = Uri.parse(
        "$baseURL/doctors?${showAll != null && showAll ? "show_all=1" : ""}${locationID != null && locationID != "" ? "&location_id=$locationID" : ""}");
    final res = await http.get(_url);

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      _list = _res.data!;
      generateSpecialityList();
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return DoctorResponse(message: json.decode(res.body)['message']);
    }
  }

  List<DoctorData> getRecommendedList() {
    return _recommendedList;
  }

  Future<DoctorResponse> fetchRecommendedList(
    String baseURL,
    String? locationID,
  ) async {
    var _url = Uri.parse("$baseURL/recommended/doctors");
    final res = await http.post(_url, body: {"location_id": locationID ?? ""});

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      _recommendedList = _res.data!;
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return DoctorResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<DoctorResponse?> fetchTodayAvailableList(
    String baseURL,
    String? locationID,
  ) async {
    var _url = Uri.parse("$baseURL/todays/doctors");
    final res = await http.post(_url, body: {"location_id": locationID ?? ""});

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      todaysList = _res.data!;
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return null;
    }
  }

  Future<DoctorResponse> login(
    String baseURL,
    String? phoneNumber,
    String? fcmToken,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/login");
    final res = await http.post(_url, body: {
      "phone_number": phoneNumber ?? "",
      "fcm_token": fcmToken ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      _loginTime = DateTime.now();
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      if (_res.data!.isNotEmpty) {
        _doctorData = _res.data![0];
      }
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return DoctorResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> logout(
    String baseURL,
    String? doctorID,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/logout");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      notifyListeners();
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<DoctorResponse> fetchData(
      String baseURL, String? patientID, String? doctorID) async {
    var _url = Uri.parse("$baseURL/doctor");
    final res = await http.post(_url,
        body: {"user_id": patientID ?? "", "doctor_id": doctorID ?? ""});
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      var _res = DoctorResponse.fromJson(json.decode(res.body));
      _doctorData = _res.data!.first;
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return DoctorResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel?> clinishareLogin(
    String baseURL,
    String? fcmToken,
    String? doctorID,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/qr/login");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "fcm_token": fcmToken ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      return null;
    }
  }

  List<DoctorTimeslotData> timeslots = [];

  Future<DoctorTimeslots?> fetchTimeSlots(
    String baseURL,
    String? doctorID,
    String? fromDate,
    String? toDate,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/all/timeslots");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "from_date": fromDate ?? "",
      "to_date": toDate ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      var _res = DoctorTimeslots.fromJson(json.decode(res.body));
      timeslots = _res.data!;
      return _res;
    } else {
      log(res.body);
      return null;
    }
  }

  Future<ResponseModel?> doctorCheckInOut(
    String baseURL,
    String? doctorID,
    String? deviceID,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/check/in/out");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "device_id": deviceID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      return null;
    }
  }

  List<DoctorCheckInOutData> checkInOutHistory = [];

  Future<DoctorCheckInOutHistory?> doctorCheckInOutHistory(
    String baseURL,
    String? doctorID,
    String? fromDate,
    String? toDate,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/check/in/history");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "from": fromDate ?? "",
      "to": toDate ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      var _res = DoctorCheckInOutHistory.fromJson(json.decode(res.body));
      checkInOutHistory = _res.data!;
      return _res;
    } else {
      log(res.body);
      return null;
    }
  }

  Future<LatestTimeslotResponse?> fetchlatestTimeslot(
    String baseURL,
    String? doctorID,
    String? locationID,
  ) async {
    var _url = Uri.parse(
        "$baseURL/doctor/get/latest/timeslot?${doctorID != null && doctorID != "" ? "doctor_id=$doctorID" : ""}${locationID != null && locationID != "" ? "&location_id=$locationID" : ""}");
    final res = await http.get(_url);
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      var _res = LatestTimeslotResponse.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      return null;
    }
  }

  List<Speciality> getSpecialityList() {
    return specialityList;
  }

  generateSpecialityList() {
    List<DoctorData> docs = [..._list];
    List<String> tempSpec = [];
    List<Speciality> specs = [];
    for (var i = 0; i < docs.length; i++) {
      if (!tempSpec.contains(json.encode(docs[i].speciality))) {
        tempSpec.add(json.encode(docs[i].speciality));
        specs.add(docs[i].speciality!);
      }
    }
    specialityList = specs;
    notifyListeners();
  }
}
