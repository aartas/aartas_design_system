import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:aartas_design_system/models/visit_user_response.dart';
import 'package:aartas_design_system/models/visits_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class VisitPurposeProvider extends ChangeNotifier {
  List<VisitPurposeData> list = [];

  List<VisitPurposeData> getList() {
    return list;
  }

  Future<VisitPurposeListResponse?> fetchList(
    String? baseUrl,
  ) async {
    var url = Uri.parse("$baseUrl/user/visit/purpose/list");

    final res = await http.get(url);
    log("(${res.statusCode}) $url");

    if (res.statusCode == 200) {
      var _res = VisitPurposeListResponse.fromJson(json.decode(res.body));
      list = _res.data!;
      notifyListeners();
      return _res;
    } else {
      return null;
    }
  }

  Future<VisitUserResponse?> register(
    String? baseURL,
    String? fullName,
    String? phoneNumber,
  ) async {
    var url = Uri.parse("$baseURL/user/register");

    final res = await http.post(
      url,
      body: {
        "name": fullName ?? "",
        "phone_number": phoneNumber ?? "",
      },
    );

    log("(${res.statusCode}) $url");
    if (res.statusCode == 200) {
      notifyListeners();
      return VisitUserResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return null;
    }
  }

  Future<VisitUserResponse?> checkUserIfExists(
    String? baseURL,
    String? phoneNumber,
  ) async {
    var url = Uri.parse("$baseURL/user/check/if/exists");

    final res = await http.post(
      url,
      body: {
        "phone_number": phoneNumber ?? "",
      },
    );

    log("(${res.statusCode}) $url");
    if (res.statusCode == 200) {
      notifyListeners();
      return VisitUserResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return null;
    }
  }
}
