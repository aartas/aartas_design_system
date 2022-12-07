import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/home_feed_like_model.dart';
import 'package:aartas_design_system/models/home_feed_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class HomeFeedProvider with ChangeNotifier {
  HomeFeedData _homeFeedData = HomeFeedData();
  List<HomeFeedData> _homeFeedList = [];

  HomeFeedData getData() {
    return _homeFeedData;
  }

  List<HomeFeedData> getList() {
    return _homeFeedList;
  }

  Future<HomeFeedResponse> fetchList(
    String baseURL,
    String? patientId,
  ) async {
    var _url = Uri.parse("$baseURL/home");
    final res = await http.post(
      _url,
      body: {"user_id": patientId ?? ""},
    );
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      notifyListeners();
      var _res = HomeFeedResponse.fromJson(json.decode(res.body));
      _homeFeedList = _res.data!;
      return _res;
    } else {
      notifyListeners();
      log(res.body);
      return HomeFeedResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<HomeFeedResponse> fetchData(
    String baseURL,
    String? patientID,
    String? homeFeedId,
  ) async {
    var _url = Uri.parse("$baseURL/home/details");
    final res = await http.post(
      _url,
      body: {
        "user_id": patientID ?? "",
        "home_feed_id": homeFeedId ?? "",
      },
    );
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      notifyListeners();
      var _res = HomeFeedResponse.fromJson(json.decode(res.body));
      _homeFeedData = _res.data!.first;
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return HomeFeedResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> like(
    String baseURL,
    String? patientID,
    String? homeFeedId,
  ) async {
    notifyListeners();
    var _url = Uri.parse("$baseURL/home/like");
    final res = await http.post(
      _url,
      body: {
        "patient_id": patientID ?? "",
        "home_feed_id": homeFeedId ?? "",
      },
    );
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<HomeFeedLikeResponse> checklike(
    String baseURL,
    String? patientID,
    String? homeFeedId,
  ) async {
    notifyListeners();
    var _url = Uri.parse("$baseURL/home/like");
    final res = await http.post(
      _url,
      body: {
        "user_id": patientID ?? "",
        "home_feed_id": homeFeedId ?? "",
      },
    );
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      var _res = HomeFeedLikeResponse.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      return HomeFeedLikeResponse(message: json.decode(res.body)['message']);
    }
  }
}
