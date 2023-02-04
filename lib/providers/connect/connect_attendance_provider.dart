import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/connect_attendance_details_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ConnectAttendanceProvider extends ChangeNotifier {
  List<ConnectAttendanceDetailsData> _attendanceDetails = [];

  List<ConnectAttendanceDetailsData> getAttendanceDetailsList() {
    return _attendanceDetails;
  }

  Future<ConnectAttendanceDetailsResponse> fetchAttendanceDetailsList(
    String baseURL,
    String? adminUserId,
    String? from,
    String? to,
  ) async {
    var _url = Uri.parse("$baseURL/connect/team/attendance/details");
    final res = await http.post(_url, body: {
      "admin_user_id": adminUserId ?? "",
      "from": from ?? "",
      "to": to ?? "",
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res =
          ConnectAttendanceDetailsResponse.fromJson(json.decode(res.body));
      _attendanceDetails = _res.data!;
      notifyListeners();
      return _res;
    } else {
      notifyListeners();
      log(res.body);
      return ConnectAttendanceDetailsResponse(
        message: json.decode(res.body)['message'],
      );
    }
  }

  Future<ResponseModel> scanQrToCheckInCheckOut(
    String baseURL,
    String? adminUserId,
    String? clinicId,
    String? lat,
    String? lng,
  ) async {
    var _url = Uri.parse("$baseURL/connect/team/checkin/checkout");
    final res = await http.post(_url, body: {
      "admin_user_id": adminUserId ?? "",
      "clinic_id": clinicId ?? "",
      "latitude": lat ?? "",
      "longitude": lng ?? "",
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      notifyListeners();
      log(res.body);
      return ResponseModel(
        message: json.decode(res.body)['message'],
      );
    }
  }
}
