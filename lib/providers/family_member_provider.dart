import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/family_members_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FamilyMembersProvider extends ChangeNotifier {
  List<FamilyMemberData> _familyMemberDataList = [];

  List<FamilyMemberData> getList() {
    return _familyMemberDataList;
  }

  bool _isLoading = false;
  bool isLoading() {
    return _isLoading;
  }

  Future<FamilyMemberResponse> fetchList(
    String baseURL,
    String? patientId,
  ) async {
    _isLoading = true;
    notifyListeners();
    var _url = Uri.parse("$baseURL/patient/child/accounts");
    final res = await http.post(_url, body: {"patient_id": patientId ?? ''});
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      var _res = FamilyMemberResponse.fromJson(json.decode(res.body));
      _familyMemberDataList = _res.data!;
      _isLoading = false;
      notifyListeners();

      return _res;
    } else {
      log(res.body);
      _isLoading = false;
      notifyListeners();
      return FamilyMemberResponse(message: _message);
    }
    // return FamilyMemberResponse.fromJson(json.decode(res.body));
  }
}
