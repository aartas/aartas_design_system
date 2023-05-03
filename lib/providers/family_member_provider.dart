import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/family_members_model.dart';
import 'package:aartas_design_system/models/patient_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FamilyMembersProvider extends ChangeNotifier {
  List<PatientData> _familyMemberDataList = [];

  List<PatientData> getList() {
    return _familyMemberDataList;
  }

  Future<FamilyMemberResponse> fetchList(
    String baseURL,
    String? patientId,
  ) async {
    var _url = Uri.parse("$baseURL/patient/child/accounts");
    final res = await http.post(_url, body: {"patient_id": patientId ?? ''});
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      var _res = FamilyMemberResponse.fromJson(json.decode(res.body));
      _familyMemberDataList = _res.data!;
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return FamilyMemberResponse(message: json.decode(res.body)['message']);
    }
    // return FamilyMemberResponse.fromJson(json.decode(res.body));
  }
}
