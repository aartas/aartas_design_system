import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/patient_cart_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientCartProvider extends ChangeNotifier {
  PatientCartData _data = PatientCartData();

  PatientCartData getCartDetails() {
    return _data;
  }

  Future<PatientCartResponse> fetchCartDetails(
    String baseURL,
    String? patientID,
  ) async {
    var _url = Uri.parse("$baseURL/patient/cart");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = PatientCartResponse.fromJson(json.decode(res.body));
      _data = _res.data!;
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return PatientCartResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> patientCartCheckout(
    String baseURL,
    String? patientID,
    String? payID,
    String? deliver,
    String? shippingAddressID,
    String? billingAddressID,
  ) async {
    var _url = Uri.parse("$baseURL/patient/cart/checkout");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
      "pay_id": payID ?? "",
      "deliver": deliver ?? "",
      "shipping_address_id": shippingAddressID ?? "",
      "billing_address_id": billingAddressID ?? "",
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> updateCartMedicineStatus(
    String baseURL,
    String? patientID,
    String? buyStatus,
    String? cartMedicineId,
    String? qty,
  ) async {
    var _url = Uri.parse("$baseURL/patient/change/cart/medicine/status");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
      "buy_status": buyStatus ?? "",
      "cart_medicine_id": cartMedicineId ?? "",
      "qty": qty ?? "",
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      notifyListeners();
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }
}
