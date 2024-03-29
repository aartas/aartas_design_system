import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:aartas_design_system/models/patient_response_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:aartas_design_system/models/version_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

class PatientProvider with ChangeNotifier {
  PatientData _patientData = PatientData();
  List<PatientData> _patientList = [];

  PatientData getData() {
    return _patientData;
  }

  List<PatientData> getList() {
    return _patientList;
  }

  Future<PatientResponse> fetchData(
    String baseURL,
    String? phoneNumber,
  ) async {
    var _url = Uri.parse("$baseURL/login");
    final res = await http.post(_url, body: {"phone_number": phoneNumber});
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      var _res = PatientResponse.fromJson(json.decode(res.body));
      _patientData = _res.data!.first;
      notifyListeners();
      return _res;
    } else {
      notifyListeners();
      log(res.body);
      return PatientResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<PatientResponse> fetchList(
    String baseURL,
    String? doctorID,
    String? search,
    String? limit,
    String? offset,
    bool? manageState,
  ) async {
    var _url = Uri.parse("$baseURL/patient/list");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "search": search ?? "",
      "limit": limit ?? "",
      "offset": offset ?? "",
    });

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      notifyListeners();
      var _res = PatientResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState == true) {
        _patientList = _res.data!;
        notifyListeners();
      }
      return _res;
    } else {
      notifyListeners();
      log(res.body);
      return PatientResponse(message: "${res.statusCode}");
    }
  }

  List<AppointmentData> _pastVisits = [];

  List<AppointmentData> getPastVisits() {
    return _pastVisits;
  }

  Future<AppointmentResponse> fetchPastVisits(
    String baseURL,
    String? patientID,
    String? doctorID,
    String? limit,
    String? offset,
    bool? manageState,
  ) async {
    var _url = Uri.parse("$baseURL/clinishare/get/patient/past/visits");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
      "doctor_id": doctorID ?? "",
      "limit": limit ?? "",
      "offset": offset ?? "",
    });
    if (res.statusCode == 200) {
      notifyListeners();
      var _res = AppointmentResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState) {
        _pastVisits = _res.data!;
        notifyListeners();
      }
      return _res;
    } else {
      String _message = "";
      log(_message);
      notifyListeners();
      return AppointmentResponse(
        message: json.decode(res.body)['message'],
      );
    }
  }

  Future<ResponseModel> updateProfile(
    String baseURL,
    String? patientID,
    String? fullName,
    String? phoneNumber,
    String? email,
    String? gender,
    String? dob,
    String? relation,
  ) async {
    var _url = Uri.parse("$baseURL/patient/update/profile");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
      "full_name": fullName ?? "",
      "phone_number": phoneNumber ?? "",
      "email": email ?? "",
      "gender": gender ?? "",
      "dob": dob ?? "",
      "relation": relation ?? "",
    });
    log("(${res.statusCode}) $_url");
    if (res.statusCode == 200) {
      notifyListeners();
      var _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      notifyListeners();
      log(res.body);
      return ResponseModel(
        message: "Something went wrong",
      );
    }
  }

  Future<void> logout() async {
    _patientData = PatientData();
    notifyListeners();
  }

  Future<PatientResponse?> register(
    String? baseURL,
    String? fullName,
    String? gender,
    String? dob,
    String? phoneNumber,
    String? phoneCountryCode,
    String? relation,
    String? linkId,
    String? location,
    String? email,
  ) async {
    var url = Uri.parse("$baseURL/register");

    final res = await http.post(
      url,
      body: {
        "full_name": fullName,
        "phone_number": phoneNumber ?? "",
        "phone_country_code": phoneCountryCode ?? "",
        "gender": gender ?? "",
        "dob": dob ?? "",
        "relation": relation ?? "",
        "link_id": linkId ?? "",
        "location": location ?? "",
        "email": email ?? "",
      },
    );

    log("(${res.statusCode}) $url");
    if (res.statusCode == 200) {
      notifyListeners();
      return PatientResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return null;
    }
  }

  Future<ResponseModel?> customEvent(
    String baseURL,
    String patientId,
    String event,
    String appointmentId,
    String specialityId,
    String doctorId,
    String homeFeedId,
  ) async {
    var url = Uri.parse("$baseURL/patient/history/add");

    return verifyVersion(baseURL).then((value) async {
      final res = await http.post(
        url,
        body: {
          "patient_id": patientId,
          "event": event,
          "appointment_id": appointmentId,
          "speciality_id": specialityId,
          "doctor_id": doctorId,
          "home_feed_id": homeFeedId,
        },
      );

      log("(${res.statusCode}) $url");
      if (res.statusCode == 200) {
        notifyListeners();
        return ResponseModel.fromJson(json.decode(res.body));
      } else {
        return null;
      }
    });
  }
}

Future<Version> getVersion(baseURL) async {
  var url = Uri.parse("$baseURL/version/list");
  final res = await http.get(url);
  log("(${res.statusCode}) $url");
  if (res.statusCode == 200) {
    return Version.fromJson(json.decode(res.body));
  } else {
    return Version(
      status: true,
      message: "${res.statusCode}",
      data: VersionData(
        versionList: [
          VersionList(
            value: "0.0.0",
          )
        ],
      ),
    );
  }
}

enum VersionStatus { none, minor, major, testing }

Future<VersionStatus> verifyVersion(baseURL) async {
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  return getVersion(baseURL).then((value) {
    String current = packageInfo.version;
    String latest = value.data!.versionList![0].value!;

    if (int.parse(latest.split(".")[0]) < int.parse(current.split(".")[0]) &&
        int.parse(latest.split(".")[1]) < int.parse(current.split(".")[1]) &&
        int.parse(latest.split(".")[2]) < int.parse(current.split(".")[2])) {
      return VersionStatus.testing;
    }

    if (int.parse(latest.split(".")[0]) > int.parse(current.split(".")[0]) &&
        int.parse(latest.split(".")[1]) >= int.parse(current.split(".")[1])) {
      return VersionStatus.major;
    }

    if (int.parse(latest.split(".")[0]) == int.parse(current.split(".")[0]) &&
        int.parse(latest.split(".")[1]) == int.parse(current.split(".")[1]) &&
        int.parse(latest.split(".")[2]) > int.parse(current.split(".")[2])) {
      return VersionStatus.minor;
    }
    return VersionStatus.none;
  });
}
