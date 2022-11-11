import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddressProvider extends ChangeNotifier {
  Future<ResponseModel> addAddress(
    String baseURL,
    String? patientID,
    String? fullName,
    String? addline1,
    String? addline2,
    String? zipcode,
    String? country,
    String? state,
    String? city,
  ) async {
    var _url = Uri.parse("$baseURL/patient/add/address");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
      "full_name": fullName ?? "",
      "address_line1": addline1 ?? "",
      "address_line2": addline2 ?? "",
      "zip_code": zipcode ?? "",
      "country": country ?? "",
      "state": state ?? "",
      "city": city ?? "",
    });
    if (res.statusCode == 200) {
      notifyListeners();
      var _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      String _message = "";
      log(_message);
      notifyListeners();
      return ResponseModel(
        message: _message,
      );
    }
  }

  Future<ResponseModel> updateAddress(
    String baseURL,
    String? addressID,
    String? fullName,
    String? addline1,
    String? addline2,
    String? zipcode,
    String? country,
    String? state,
    String? city,
  ) async {
    var _url = Uri.parse("$baseURL/patient/update/address");
    final res = await http.post(_url, body: {
      "address_id": addressID ?? "",
      "full_name": fullName ?? "",
      "address_line1": addline1 ?? "",
      "address_line2": addline2 ?? "",
      "zip_code": zipcode ?? "",
      "country": country ?? "",
      "state": state ?? "",
      "city": city ?? "",
    });
    if (res.statusCode == 200) {
      notifyListeners();
      var _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      String _message = "";
      log(_message);
      notifyListeners();
      return ResponseModel(
        message: _message,
      );
    }
  }

  Future<ResponseModel> deleteAddress(
    String baseURL,
    String? addressID,
  ) async {
    var _url = Uri.parse("$baseURL/patient/delete/address");
    final res = await http.post(_url, body: {
      "address_id": addressID ?? "",
    });
    if (res.statusCode == 200) {
      notifyListeners();
      var _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      String _message = "";
      log(_message);
      notifyListeners();
      return ResponseModel(
        message: _message,
      );
    }
  }
}
