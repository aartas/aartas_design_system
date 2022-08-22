import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/family_members_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FamilyMembersProvider extends ChangeNotifier {
  Future<FamilyMemberResponse> getList(
    String baseURL,
    String? patientId,
  ) async {
    var _url = Uri.parse("$baseURL/patient/child/accounts");
    final res = await http.post(_url, body: {"patient_id": patientId ?? ''});

    log("Network:${json.decode(res.body)['message']}");
    return FamilyMemberResponse.fromJson(json.decode(res.body));
  }
}
