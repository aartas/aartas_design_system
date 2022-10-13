import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/coupon_model.dart';
import 'package:aartas_design_system/models/reward_models/rewards_history_model.dart';
import 'package:aartas_design_system/models/reward_models/rewards_membership_model.dart';
import 'package:aartas_design_system/models/reward_models/rewards_points_model.dart';
import 'package:aartas_design_system/models/reward_models/rewards_type_list_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class RewardProvider extends ChangeNotifier {
  RewardPointsData _rewardPointsData = RewardPointsData();

  RewardPointsData getRewardPointsData() {
    return _rewardPointsData;
  }

  bool _isLoading = false;
  bool isLoading() {
    return _isLoading;
  }

  Future<RewardPointsResponse> fetchRewardPoints(
    String baseURL,
    String? patientID,
  ) async {
    _isLoading = true;
    notifyListeners();
    var _url = Uri.parse("$baseURL/get/patient/total/points");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      _isLoading = false;
      notifyListeners();
      var _res = RewardPointsResponse.fromJson(json.decode(res.body));
      _rewardPointsData = _res.data!;
      return _res;
    } else {
      _isLoading = false;
      notifyListeners();
      log(res.body);
      return RewardPointsResponse(message: _message);
    }
  }

  List<RewardHistoryData> _rewardHistoryData = [];

  List<RewardHistoryData> getRewardHistoryData() {
    return _rewardHistoryData;
  }

  Future<RewardHistoryResponse> fetchRewardHistory(
    String baseURL,
    String? patientID,
  ) async {
    _isLoading = true;
    notifyListeners();
    var _url = Uri.parse("$baseURL/get/patient/points/history");
    final res = await http.post(_url, body: {"patient_id": patientID ?? ""});

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      _isLoading = false;
      notifyListeners();
      var _res = RewardHistoryResponse.fromJson(json.decode(res.body));
      _rewardHistoryData = _res.data!;
      return _res;
    } else {
      _isLoading = false;
      notifyListeners();
      log(res.body);
      return RewardHistoryResponse(message: _message);
    }
  }

  List<RewardTypeListData> _rewardTypeListData = [];

  List<RewardTypeListData> getRewardTypeList() {
    return _rewardTypeListData;
  }

  Future<RewardTypeListResponse> fetchRewardTypeList(
    String baseURL,
  ) async {
    _isLoading = true;
    notifyListeners();
    var _url = Uri.parse("$baseURL/membership/list");
    final res = await http.get(_url);

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      _isLoading = false;
      notifyListeners();
      var _res = RewardTypeListResponse.fromJson(json.decode(res.body));
      _rewardTypeListData = _res.data!;
      return _res;
    } else {
      _isLoading = false;
      notifyListeners();
      log(res.body);
      return RewardTypeListResponse(message: _message);
    }
  }

  MembershipData _membershipData = MembershipData();

  MembershipData getMembershipData() {
    return _membershipData;
  }

  Future<MembershipResponse> fetchMembershipData(
    String baseURL,
    String? patientID,
  ) async {
    _isLoading = true;
    notifyListeners();
    var _url = Uri.parse("$baseURL/check/membership");
    final res = await http.post(_url, body: {"patient_id": patientID ?? ""});

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      _isLoading = false;
      notifyListeners();
      var _res = MembershipResponse.fromJson(json.decode(res.body));
      _membershipData = _res.data!;
      notifyListeners();
      return _res;
    } else {
      _isLoading = false;
      notifyListeners();
      log(res.body);
      return MembershipResponse(message: _message);
    }
  }

  List<Coupon> _rewardCouponList = [];
  List<Coupon> getRewardCouponList() {
    return _rewardCouponList;
  }

  Future<CouponResponse> fetchRewardCouponList(
    String baseURL,
    String? patientID,
  ) async {
    _isLoading = true;
    notifyListeners();
    var _url = Uri.parse("$baseURL/points/coupon/list");
    var res = await http.post(_url, body: {
      "user_id": patientID,
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      _isLoading = false;
      notifyListeners();
      var _res = CouponResponse.fromJson(json.decode(res.body));
      _rewardCouponList = _res.data!.coupon!;
      notifyListeners();
      return _res;
    } else {
      _isLoading = false;
      notifyListeners();
      log(res.body);
      return CouponResponse(message: _message);
    }
  }
}
