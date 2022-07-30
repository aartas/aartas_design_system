import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/medicine_model.dart';
import 'package:aartas_design_system/models/medicine_unit_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MedicineProvider extends ChangeNotifier {
  Future<MedicineUnitResponse> fetchUnitList() async {
    var _url = Uri.parse("$baseURL/medicine/unit/list");
    final res = await http.post(_url);

    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      return MedicineUnitResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return MedicineUnitResponse(message: _message);
    }
  }

  Future<MedicineResponse> fetchMedicineList(
    String? doctorID,
    String? specialityID,
    String? search,
    String? limit,
    String? offset,
  ) async {
    var _url = Uri.parse("$baseURL/medicine/list");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "speciality_id": specialityID ?? "",
      "search": search ?? "",
      "limit": limit ?? "",
      "offset": offset ?? "",
    });

    String _message =
        "(${res.statusCode}) $_url: doctorID:$doctorID, specialityID:$specialityID, search:$search, limit:$limit, offset:$offset";
    log(_message);
    if (res.statusCode == 200) {
      return MedicineResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return MedicineResponse(message: _message);
    }
  }
}
