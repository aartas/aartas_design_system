import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/models/add_category_response_model.dart';
import 'package:aartas_design_system/models/complaints_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComplaintProvider extends ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  Future<ComplaintsResponse> fetchComplaintList(
    BuildContext context,
    String baseURL,
    String? doctorID,
    String? specialityID,
    String? search,
    String? limit,
    String? offset,
  ) async {
    var _url = Uri.parse("$baseURL/complaints/list");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "speciality_id": specialityID ?? "",
      "search": search ?? "",
      "limit": limit ?? "",
      "offset": offset ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      return ComplaintsResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return ComplaintsResponse.fromJson(json.decode(res.body));
    }
  }

  Future<AddCategoryResponse> addComplaints(
    String baseURL,
    String? title,
  ) async {
    var _url = Uri.parse("$baseURL/add/complaints");
    final res = await http.post(_url, body: {
      "title": title ?? "",
    });
    String _message = "(${res.statusCode}) $_url: title:$title";
    log(_message);

    if (res.statusCode == 200) {
      return AddCategoryResponse.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      return AddCategoryResponse(message: json.decode(res.body)['message']);
    }
  }

  Future<ResponseModel> saveComplaints(
    String baseURL,
    String? appointmentID,
    String? complaintID,
    String? negativeSymptom,
    String? duration,
    String? durationType,
    String? severity,
    String? progress,
    String? oldID,
    String? notes,
  ) async {
    var _url = Uri.parse("$baseURL/save/complaints");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
      "complaints_id": complaintID ?? "",
      "negative_symptom": negativeSymptom ?? "",
      "duration": duration ?? "",
      "duration_type": durationType ?? "",
      "severity": severity ?? "",
      "progress": progress ?? "",
      "notes": notes ?? "",
      "old_id": oldID ?? "",
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

  Future<ResponseModel> removecomplaint(
    String baseURL,
    String? id,
  ) async {
    var _url = Uri.parse("$baseURL/remove/complaints");
    final res = await http.post(_url, body: {
      "id": id ?? "",
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

  Future<ResponseModel> addQuickActionComplaint(
    String baseURL,
    String? doctorQuickActionID,
    String? complaintID,
    String? negativeSymptom,
    String? duration,
    String? durationType,
    String? severity,
    String? progress,
    String? oldID,
    String? notes,
  ) async {
    var _url = Uri.parse("$baseURL/doctor/save/quickaction/complaint");
    final res = await http.post(_url, body: {
      "doctor_quickaction_id": doctorQuickActionID ?? "",
      "complaints_id": complaintID ?? "",
      "negative_symptom": negativeSymptom ?? "",
      "duration": duration ?? "",
      "duration_type": durationType ?? "",
      "severity": severity ?? "",
      "progress": progress ?? "",
      "notes": notes ?? "",
      "old_id": oldID ?? "",
    });
    String _message = "(${res.statusCode}) $_url";
    log(_message);
    if (res.statusCode == 200) {
      _isLoading = false;
      return ResponseModel.fromJson(json.decode(res.body));
    } else {
      log(res.body);
      _isLoading = false;
      return ResponseModel(
        message: "(${res.statusCode}) Something went wrong.",
      );
    }
  }

  Future<ResponseModel> removeQuickActionComplaint(
    String baseURL,
    String? id,
  ) async {
    var _url = Uri.parse("$baseURL/delete/doctor/quickaction/complaint");
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
  // Future<ResponseModel> fetchQuickActionList(String baseURL) async {
  //   var _url = Uri.parse("$baseURL/quick/action/list");
  //   final res = await http.post(_url);
  //   String _message = "(${res.statusCode}) $_url";
  //   log(_message);

  //   if (res.statusCode == 200) {
  //     return ResponseModel.fromJson(json.decode(res.body));
  //   } else {
  //     log(res.body);
  //     return ResponseModel(message: json.decode(res.body)['message']);
  //   }
  // }

  // Future<ResponseModel> addQuickActionValue(
  //   String baseURL,
  //   String? appointmenID,
  //   String? quickActionID,
  // ) async {
  //   var _url = Uri.parse("$baseURL/quick/action/add");
  //   final res = await http.post(_url);
  //   String _message = "(${res.statusCode}) $_url";
  //   log(_message);

  //   if (res.statusCode == 200) {
  //     return ResponseModel.fromJson(json.decode(res.body));
  //   } else {
  //     log(res.body);
  //     return ResponseModel(message: json.decode(res.body)['message']);
  //   }
  // }
}
