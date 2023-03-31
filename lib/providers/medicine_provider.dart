import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/medicine_model.dart';
import 'package:aartas_design_system/models/medicine_unit_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MedicineProvider extends ChangeNotifier {
  Future<MedicineUnitResponse> fetchUnitList(
    String baseURL,
  ) async {
    var _url = Uri.parse("$baseURL/medicine/unit/list");
    final res = await http.post(_url);

    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      return MedicineUnitResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return MedicineUnitResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<MedicineResponse> fetchMedicineList(
    String baseURL,
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
      return MedicineResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> addMedicine(
    String baseURL,
    String? title,
  ) async {
    var _url = Uri.parse("$baseURL/save/medicine");
    final res = await http.post(_url, body: {
      "name": title ?? "",
    });
    String _message = "(${res.statusCode}) $_url: title:$title";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel(
        message: json.decode(res.body)['message'],
        status: json.decode(res.body)['status'],
      );
    } else {
      log(res.body);
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> saveMedicine(
    String baseURL,
    String? appointmentID,
    String? medicineID,
    String? dose,
    String? unitID,
    String? qty,
    String? frequency,
    String? duration,
    String? durationType,
    String? startDate,
    String? instructions,
    String? timeOfTheDayDefaults,
    String? timeOfTheDay,
    String? timeRange,
    String? oldID,
  ) async {
    var _url = Uri.parse("$baseURL/save/appointment/medicine");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
      "medicine_id": medicineID ?? "",
      "dose": dose ?? "",
      "unit_id": unitID ?? "",
      "qty": qty ?? "",
      "frequency": frequency ?? "",
      "duration": duration ?? "",
      "duration_type": durationType ?? "",
      "start_date": startDate ?? "",
      "instructions": instructions ?? "",
      "time_of_the_day_defaults": timeOfTheDayDefaults ?? "",
      "time_of_the_day": timeOfTheDay ?? "",
      "time_range": timeRange ?? "",
      "old_id": oldID ?? ""
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> removeMedicine(
    String baseURL,
    String? id,
  ) async {
    var _url = Uri.parse("$baseURL/remove/medicine");
    final res = await http.post(_url, body: {
      "id": id ?? "",
    });
    String _message = "(${res.statusCode}) $_url: id:$id";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> addQuickActionMedicine(
    String baseURL,
    String? doctorQuickActionID,
    String? medicineID,
    String? dose,
    String? unitID,
    String? qty,
    String? frequency,
    String? duration,
    String? durationType,
    String? startDate,
    String? instructions,
    String? timeOfTheDayDefaults,
    String? timeOfTheDay,
    String? timeRange,
    String? oldID,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/save/quickaction/medicine");
    final res = await http.post(_url, body: {
      "doctor_quickaction_id": doctorQuickActionID ?? "",
      "medicine_id": medicineID ?? "",
      "dose": dose ?? "",
      "unit_id": unitID ?? "",
      "qty": qty ?? "",
      "frequency": frequency ?? "",
      "duration": duration ?? "",
      "duration_type": durationType ?? "",
      "start_date": startDate ?? "",
      "instructions": instructions ?? "",
      "time_of_the_day_defaults": timeOfTheDayDefaults ?? "",
      "time_of_the_day": timeOfTheDay ?? "",
      "time_range": timeRange ?? "",
      "old_id": oldID ?? ""
    });

    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> removeQuickActionMedicine(
    String baseURL,
    String? id,
  ) async {
    var _url = Uri.parse("$baseURL/delete/doctor/quickaction/medicine");
    final res = await http.post(_url, body: {
      "id": id ?? "",
    });
    String _message = "(${res.statusCode}) $_url: id:$id";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ResponseModel(message: json.decode(res.body)['message']);
    }
  }
}
