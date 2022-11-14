import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/address_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddressProvider extends ChangeNotifier {
  List<Address> _list = [];

  List<Address> getData() {
    return _list;
  }

  Future<AddressResponse> fetchList(
    String baseURL,
    String? patientID,
  ) async {
    var _url = Uri.parse("$baseURL/patient/address/list");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
    });
    log("(${res.statusCode}) $_url");
    if (res.statusCode == 200) {
      notifyListeners();
      var _res = AddressResponse.fromJson(json.decode(res.body));
      _list = _res.data!;
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return AddressResponse();
    }
  }

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
    log("(${res.statusCode}) $_url");
    if (res.statusCode == 200) {
      notifyListeners();
      var _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return ResponseModel(
        message: "${res.statusCode} Something went wrong.",
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
    log("(${res.statusCode}) $_url");
    if (res.statusCode == 200) {
      notifyListeners();
      var _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return ResponseModel(
        message: "${res.statusCode} Something went wrong.",
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
    log("(${res.statusCode}) $_url");
    if (res.statusCode == 200) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      return _res;
    } else {
      log(res.body);
      return ResponseModel(
        message: "${res.statusCode} Something went wrong.",
      );
    }
  }
}
