import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/campaign_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CampaignProvider extends ChangeNotifier {
  CampaignData campaignData = CampaignData();

  Future<CampaignData?> fetchData(
    String? baseURL,
    String? slug,
  ) async {
    var _url = Uri.parse("$baseURL/get/campaign/details");
    final res = await http.post(_url, body: {
      "slug": slug ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      final _res = CampaignData.fromJson(json.decode(res.body));
      campaignData = _res;
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return null;
    }
  }
}
