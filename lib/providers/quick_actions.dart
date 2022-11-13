import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuickActionProvider extends ChangeNotifier {
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  Future<ResponseModel> fetchQuickAction(
    String baseURL,
    String? doctorID,
    String? categoryType,
  ) async {
    var _url = Uri.parse("$baseURL/get/doctor/quickaction/$categoryType");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
    });

    log("(${res.statusCode}) $_url");
    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(
          message: "(${res.statusCode}) Something went Wrong.");
    }
  }

  Future<ResponseModel> addQuickAction(
    String baseURL,
    String? doctorID,
    String? title,
    String? categoryID,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/add/quickaction");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "title": title ?? "",
      "category_id": categoryID ?? "",
    });

    log("${res.statusCode} - $_url");
    if (res.statusCode == 200) {
      _isLoading = false;
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      _isLoading = false;
      log(res.body);
      return ResponseModel(
        message: "(${res.statusCode}) Something went wrong.",
      );
    }
  }

  Future<ResponseModel> deleteQuickAction(
    String baseURL,
    String? quickActionID,
  ) async {
    var _url = Uri.parse("$baseURL/delete/doctor/quickaction");
    final res = await http.post(_url, body: {
      "quick_action_id": quickActionID ?? "",
    });

    log("${res.statusCode} - $_url");
    if (res.statusCode == 200) {
      _isLoading = false;
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      _isLoading = false;
      log(res.body);
      return ResponseModel(
        message: "(${res.statusCode}) Something went wrong.",
      );
    }
  }
}
