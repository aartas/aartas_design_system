import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientCartProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool isLoading() {
    return _isLoading;
  }

  Future<ResponseModel> fetchCartDetails(
    String baseURL,
    String? patientID,
  ) async {
    _isLoading = false;
    notifyListeners();
    var _url = Uri.parse("$baseURL/patient/cart");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      return ResponseModel(message: _message);
    }
  }

  Future<ResponseModel> patientCartCheckout(
    String baseURL,
    String? patientID,
    String? payID,
  ) async {
    _isLoading = false;
    notifyListeners();
    var _url = Uri.parse("$baseURL/patient/cart/checkout");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
      "pay_id": payID ?? "",
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      return ResponseModel(message: _message);
    }
  }

  Future<ResponseModel> updateCartMedicineStatus(
    String baseURL,
    String? patientID,
    String? buyStatus,
    String? cartMedicineId,
  ) async {
    _isLoading = false;
    notifyListeners();
    var _url = Uri.parse("$baseURL/patient/change/cart/medicine/status");
    final res = await http.post(_url, body: {
      "patient_id": patientID ?? "",
      "buy_status": buyStatus ?? "",
      "cart_medicine_id": cartMedicineId ?? "",
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200 && json.decode(res.body)['status']) {
      var _res = ResponseModel.fromJson(json.decode(res.body));
      notifyListeners();
      return _res;
    } else {
      log(res.body);
      return ResponseModel(message: _message);
    }
  }
}
