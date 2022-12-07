import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/speciality_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class SpecialityProvider with ChangeNotifier {
  Speciality _specialityData = Speciality();
  List<Speciality> _specialityList = [];

  Speciality getData() {
    return _specialityData;
  }

  List<Speciality> getList() {
    return _specialityList;
  }

  Future<SpecialityResponse> fetchList(
    String baseURL,
    String? patientId,
  ) async {
    var _url = Uri.parse("$baseURL/speciality/list");
    final res = await http.get(
      _url,
    );
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = SpecialityResponse.fromJson(json.decode(res.body));
      _specialityList = _res.data!.specialityList!;
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return SpecialityResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<SpecialityResponse> fetchData(
    String baseURL,
    String? patientID,
    String? specialityId,
  ) async {
    var _url = Uri.parse("$baseURL/speciality/$specialityId");
    final res = await http.post(
      _url,
      body: {
        "user_id": patientID ?? "",
        "speciality_id": specialityId ?? "",
      },
    );
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      var _res = SpecialityResponse.fromJson(json.decode(res.body));
      _specialityData = _res.data!.specialityList!.first;
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return SpecialityResponse(message: json.decode(res.body)['message']);
    }
  }
}
