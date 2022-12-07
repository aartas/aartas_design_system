import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/health_program_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HealthProgramProvider with ChangeNotifier {
  List<BundleList> _healthProgramList = [];

  List<BundleList> getList() {
    return _healthProgramList;
  }

  Future<HealthProgramResponse> fetchList(
    String baseURL,
    String? patientID,
    bool? manageState,
  ) async {
    var _url = Uri.parse("$baseURL/bundle/list");
    final res = await http.get(_url);

    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      final _res = HealthProgramResponse.fromJson(json.decode(res.body));
      if (manageState == null || manageState == true) {
        _healthProgramList.clear();
        _healthProgramList = _res.data!.bundleList!;
        notifyListeners();
      }
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return HealthProgramResponse(message: json.decode(res.body)['message']);
    }
  }
}
//