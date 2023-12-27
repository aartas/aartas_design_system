import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/paytm_models/paytm_sale_generate_response_model.dart';
import 'package:aartas_design_system/models/paytm_models/paytm_sale_status_response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaytmApiProvider extends ChangeNotifier {
  Future<PaytmSaleGenerateResponse?> generateSale(
    String baseURL,
    String? terminalID,
    String? transactionAmount,
    // String? paymentType,
  ) async {
    var _url = Uri.parse("$baseURL/paytm/sale/generate");
    final res = await http.post(_url, body: {
      "terminal_id": terminalID ?? "",
      "transaction_amount": transactionAmount ?? "",
      // "payment_type": paymentType ?? "",
    });

    log("(${res.statusCode}) $_url");

    if (res.statusCode == 200) {
      log(res.body);
      return PaytmSaleGenerateResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return null;
    }
  }

  Future<PaytmSaleStatusResponse?> saleStatus(
    String baseURL,
    String? merchantTransactionId,
  ) async {
    var _url = Uri.parse("$baseURL/paytm/sale/status");
    final res = await http.post(_url, body: {
      "merchant_transaction_id": merchantTransactionId ?? "",
    });

    log("(${res.statusCode}) $_url");

    if (res.statusCode == 200) {
      return PaytmSaleStatusResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return null;
    }
  }
}
