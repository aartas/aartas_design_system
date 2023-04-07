import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/coupon_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class CouponProvider with ChangeNotifier {
  Coupon _couponData = Coupon();
  List<Coupon> _couponList = [];

  Coupon getData() {
    return _couponData;
  }

  List<Coupon> getList() {
    return _couponList;
  }

  // final List<PatientData> _couponList = [];

  Future<CouponResponse> fetchList(
    String baseURL,
    String? userId,
    String? doctorId,
    String? specialityId,
  ) async {
    var _url = Uri.parse("$baseURL/coupons/list");
    final res = await http.post(
      _url,
      body: {
        "user_id": userId ?? "",
        "doctor_id": doctorId ?? "",
        "speciality_id": specialityId ?? "",
      },
    );
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = CouponResponse.fromJson(json.decode(res.body));
      _couponList = _res.data!.coupon!;
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return CouponResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<CouponResponse> fetchData(
    String baseURL,
    String? userId,
    String? couponName,
    String? doctorId,
    String? specialityId,
  ) async {
    var _url = Uri.parse("$baseURL/coupon");
    final res = await http.post(
      _url,
      body: {
        "user_id": userId ?? "",
        "coupon_name": couponName ?? "",
        "doctor_id": doctorId ?? "",
        "speciality_id": specialityId ?? "",
      },
    );
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      var _res = CouponResponse.fromJson(json.decode(res.body));
      if (_res.data != null) {
        _couponData = _res.data!.coupon![0];
        notifyListeners();
      }
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return CouponResponse(message: json.decode(res.body)['message']);
    }
  }
}
