import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/analytics_models/analytics_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AnalyticsProvider extends ChangeNotifier {
  Future<AnalyticsResponse?> getPatientAnalytics(
    String? baseURL,
    String? fromDate,
    String? toDate,
    String? xAxis, // 1.days 2.weeks 3.months 4.years
    bool? showResponse,
  ) async {
    var _url = Uri.parse("$baseURL/analytics/patients");
    final res = await http.post(
      _url,
      body: {
        "from_date": fromDate ?? "",
        "to_date": toDate ?? "",
        "x_axis": xAxis ?? "",
      },
    );

    log("(${res.statusCode}) $_url");

    if (res.statusCode == 200) {
      if (showResponse != null && showResponse) {
        log(res.body);
      }
      return AnalyticsResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return null;
    }
  }

  Future<AnalyticsResponse?> getAppointmentAnalytics(
    String? baseURL,
    String? fromDate,
    String? toDate,
    String? doctorID,
    String? patientID,
    bool? showResponse,
  ) async {
    var _url = Uri.parse("$baseURL/analytics/appointments");
    final res = await http.post(
      _url,
      body: {
        "from_date": fromDate ?? "",
        "to_date": toDate ?? "",
        "doctor_id": doctorID ?? "",
        "patient_id": patientID ?? "",
      },
    );

    log("(${res.statusCode}) $_url");

    if (res.statusCode == 200) {
      if (showResponse != null && showResponse) {
        log(res.body);
      }
      return AnalyticsResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return null;
    }
  }

  Future<AnalyticsResponse?> getBillingAnalytics(
    String? baseURL,
    String? fromDate,
    String? toDate,
    String? xAxis, // 1.days 2.weeks 3.months 4.years
    String? doctorID,
    String? patientID,
    bool? showResponse,
  ) async {
    var _url = Uri.parse("$baseURL/analytics/billing");
    final res = await http.post(
      _url,
      body: {
        "from_date": fromDate ?? "",
        "to_date": toDate ?? "",
        "x_axis": xAxis ?? "",
        "doctor_id": doctorID ?? "",
        "patient_id": patientID ?? "",
      },
    );

    log("(${res.statusCode}) $_url");

    if (res.statusCode == 200) {
      if (showResponse != null && showResponse) {
        log(res.body);
      }
      return AnalyticsResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return null;
    }
  }
}
