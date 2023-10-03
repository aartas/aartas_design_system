import 'dart:convert';

import 'package:aartas_design_system/models/clinic_model.dart';
import 'package:aartas_design_system/models/room_timings_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClinicProvider extends ChangeNotifier {
  ClinicData? locationData;
  ClinicData? clinic;
  List<ClinicData> clinicList = [];
  List<RoomTimingData> roomList = [];

  void setLocationData(lat, lng) {
    locationData = ClinicData(latitude: lat, longitude: lng);
    notifyListeners();
  }

  void setClinicData(ClinicData? data) {
    clinic = data;
    notifyListeners();
  }

  List<ClinicData> getClinicList() {
    return clinicList;
  }

  List<RoomTimingData> getRoomTimingsList() {
    return roomList;
  }

  Future<ClinicsResponse?> fetchClinicList(
    String? baseUrl,
  ) async {
    var url = Uri.parse("$baseUrl/clinic/list");
    final res = await http.get(url);
    if (res.statusCode == 200) {
      var temp = ClinicsResponse.fromJson(json.decode(res.body));
      clinicList = temp.data!;
      notifyListeners();
      return temp;
    } else {
      return null;
    }
  }

  Future<ClinicsResponse?> fetchNearestClinic(
    String baseUrl,
    String latitude,
    String longitude,
  ) async {
    var url = Uri.parse(
        "$baseUrl/get/user/nearest/location?latitude=$latitude&longitude=$longitude");
    final res = await http.get(url);
    if (res.statusCode == 200) {
      var temp = ClinicsResponse.fromJson(json.decode(res.body));
      setClinicData(temp.data!.first);
      notifyListeners();
      return temp;
    } else {
      return null;
    }
  }

  Future<RoomTimingsResponse> fetchRoomTimings(
    String? baseUrl,
    String? clinicID,
    String? roomID,
  ) async {
    var url = Uri.parse("$baseUrl/doctor/timing/list");
    final res = await http.post(url, body: {
      "clinic_id": clinicID ?? '',
      "room_id": roomID ?? '',
    });
    if (res.statusCode == 200) {
      var temp = RoomTimingsResponse.fromJson(json.decode(res.body));
      roomList = temp.data!;
      notifyListeners();
      return temp;
    } else {
      return RoomTimingsResponse();
    }
  }

  // Future<AppointmentResponse> fetchList(
  //   String baseUrl,
  //   String? patientID,
  //   String? doctorID,
  //   String? search,
  //   String? date,
  //   String? limit,
  //   String? offset,
  //   String? type,
  //   bool? manageState,
  // ) async {
  //   var _url = Uri.parse("$baseUrl/clinishare/doctor/appointment/list");
  //   final res = await http.post(_url, body: {
  //     "patient_id": patientID ?? "",
  //     "doctor_id": doctorID ?? "",
  //     "search": search ?? "",
  //     "date": date ?? "",
  //     "limit": limit ?? "",
  //     "offset": offset ?? "",
  //     "type": type ?? "",
  //   });
  //   String _message = "(${res.statusCode}) $_url:";
  //   log(_message);
  //   if (res.statusCode == 200) {
  //     final _res = AppointmentResponse.fromJson(json.decode(res.body));
  //     notifyListeners();
  //     if (manageState == null || manageState == true) {
  //       _list.clear();
  //       _list = _res.data!;
  //       notifyListeners();
  //     }
  //     return _res;
  //   } else {
  //     log(res.body);
  //     notifyListeners();
  //     return AppointmentResponse(message: json.decode(res.body)['message']);
  //   }
  // }

  // AppointmentResponse _appointmentData = AppointmentResponse();

  // Future<AppointmentResponse> fetchData(
  //   String? baseURL,
  //   String? appointmentID,
  // ) async {
  //   var _url = Uri.parse("$baseURL/appointment/details");
  //   final res = await http.post(_url, body: {
  //     "appointment_id": appointmentID ?? "",
  //   });
  //   String _message = "(${res.statusCode}) $_url";
  //   log(_message);
  //   if (res.statusCode == 200) {
  //     notifyListeners();
  //     final _res = AppointmentResponse.fromJson(json.decode(res.body));
  //     _appointmentData = _res;
  //     return _res;
  //   } else {
  //     notifyListeners();
  //     return AppointmentResponse(message: json.decode(res.body)['message']);
  //   }
  // }

  // AppointmentResponse getAppointmentData() {
  //   return _appointmentData;
  // }
}
