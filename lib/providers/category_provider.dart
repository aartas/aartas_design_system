import 'dart:convert';
import 'dart:developer';

import 'package:aartas_design_system/const.dart';
import 'package:aartas_design_system/models/category_model.dart';
import 'package:aartas_design_system/models/complaints_model.dart';
import 'package:aartas_design_system/models/diagnosis_model.dart';
import 'package:aartas_design_system/models/investigation_model.dart';
import 'package:aartas_design_system/models/response_model.dart';
import 'package:aartas_design_system/models/search_category_list.dart';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class CategoryProvider extends ChangeNotifier {
  List<CategoryData> _categoryList = [];

  List<CategoryData> getCategoryList() {
    return _categoryList;
  }

  Future<CategoryResponse> fetchCategoryList() async {
    var _url = Uri.parse("$baseURL/clinishare/get/category/list");
    final res = await http.post(_url);
    String _message = "(${res.statusCode}) $_url";
    log(_message);

    if (res.statusCode == 200) {
      _categoryList = CategoryResponse.fromJson(json.decode(res.body)).data!;
      notifyListeners();
      return CategoryResponse.fromJson(json.decode(res.body));
    }

    return CategoryResponse(message: _message);
  }

  final List<SearchCategoryData> _searchResponse = [];

  List<SearchCategoryData> getSearchResponse() {
    return _searchResponse;
  }

  Future<SearchCategoryResponse> fetchSearchResponse(
    String? type,
    String? search,
  ) async {
    var _url = Uri.parse("$baseURL/$type/list");
    final res = await http.post(_url, body: {
      "search": search ?? "",
    });
    String _message = "(${res.statusCode}) $_url: type:$type, search:$search";
    log(_message);

    if (res.statusCode == 200) {
      log("TEST: ${json.decode(res.body)['data'][type].length}");
      _searchResponse.clear();
      for (var i = 0; i < json.decode(res.body)['data'][type].length; i++) {
        _searchResponse.add(
          SearchCategoryData(
            id: json.decode(res.body)['data'][type][i]['id'],
            title: json.decode(res.body)['data'][type][i]['title'],
          ),
        );
        notifyListeners();
      }
      return SearchCategoryResponse.fromJson(json.decode(res.body));
    }

    return SearchCategoryResponse(message: _message);
  }

  // -------------------------- Complaints -----------------------------------
  Future<ComplaintsResponse> fetchComplaintList(
    String? doctorID,
    String? specialityID,
    String? search,
  ) async {
    var _url = Uri.parse("$baseURL/complaints/list");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "speciality_id": specialityID ?? "",
      "search": search ?? "",
    });
    String _message =
        "(${res.statusCode}) $_url: doctorID:$doctorID, specialityID:$specialityID, search:$search";
    log(_message);

    if (res.statusCode == 200) {
      return ComplaintsResponse.fromJson(json.decode(res.body));
    }
    return ComplaintsResponse.fromJson(json.decode(res.body));
  }

  Future<ComplaintsResponse> addComplaints(
    String? title,
  ) async {
    var _url = Uri.parse("$baseURL/add/complaints");
    final res = await http.post(_url, body: {
      "title": title ?? "",
    });
    String _message = "(${res.statusCode}) $_url: title:$title";
    log(_message);

    if (res.statusCode == 200) {
      return ComplaintsResponse.fromJson(json.decode(res.body));
    }
    return ComplaintsResponse(message: _message);
  }

  Future<ResponseModel> saveComplaints(
    String? appointmentID,
    String? complaintID,
    String? duration,
    String? durationType,
    String? severity,
    String? progress,
    String? oldID,
    String? notes,
  ) async {
    var _url = Uri.parse("$baseURL/save/complaint");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
      "investigations_id": complaintID ?? "",
      "duration": duration ?? "",
      "duration_type": durationType ?? "",
      "severity": severity ?? "",
      "progress": progress ?? "",
      "notes": notes ?? "",
      "old_id": oldID ?? "",
    });
    String _message =
        "(${res.statusCode}) $_url: appointmentID:$appointmentID, complaintID:$complaintID, duration:$duration, durationType:$durationType,severity:$severity, progress:$progress, notes:$notes, oldID:$oldID";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    }
    return ResponseModel(message: _message);
  }

  Future<ResponseModel> removecomplaint(
    String? id,
  ) async {
    var _url = Uri.parse("$baseURL/remove/complaint");
    final res = await http.post(_url, body: {
      "id": id ?? "",
    });
    String _message = "(${res.statusCode}) $_url: id:$id";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    }
    return ResponseModel(message: _message);
  }

  // -------------------------- Complaints -----------------------------------
  // -------------------------- Diagnosis -----------------------------------

  Future<DiagnosisResponse> fetchDaignosisList(
    String? doctorID,
    String? specialityID,
    String? search,
  ) async {
    var _url = Uri.parse("$baseURL/daignosis/list");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "speciality_id": specialityID ?? "",
      "search": search ?? "",
    });
    String _message =
        "(${res.statusCode}) $_url: doctorID:$doctorID, specialityID:$specialityID, search:$search";
    log(_message);

    if (res.statusCode == 200) {
      return DiagnosisResponse.fromJson(json.decode(res.body));
    }
    return DiagnosisResponse(message: _message);
  }

  Future<DiagnosisResponse> addDiagnosis(
    String? title,
  ) async {
    var _url = Uri.parse("$baseURL/add/diagnosis");
    final res = await http.post(_url, body: {
      "title": title ?? "",
    });
    String _message = "(${res.statusCode}) $_url: title:$title";
    log(_message);

    if (res.statusCode == 200) {
      return DiagnosisResponse.fromJson(json.decode(res.body));
    }
    return DiagnosisResponse(message: _message);
  }

  Future<ResponseModel> saveDiagnosis(
    String? appointmentID,
    String? diagnosisID,
    String? fastingState,
    String? duration,
    String? durationType,
    String? diagnosisStatus,
    String? medication,
    String? oldID,
  ) async {
    var _url = Uri.parse("$baseURL/save/diagnosis");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
      "diagnosis_id": diagnosisID ?? "",
      "fasting_state": fastingState ?? "",
      "duration": duration ?? "",
      "duration_type": durationType ?? "",
      "diagnosis_status": diagnosisStatus ?? "",
      "medication": medication ?? "",
      "old_id": oldID ?? "",
    });
    String _message =
        "(${res.statusCode}) $_url: appointmentID:$appointmentID, diagnosisID:$diagnosisID, fastingState:$fastingState, duration:$duration, durationType:$durationType, diagnosisStatus:$diagnosisStatus, medication:$medication, oldID:$oldID";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    }
    return ResponseModel(message: _message);
  }

  Future<ResponseModel> removeDiagnosis(
    String? id,
  ) async {
    var _url = Uri.parse("$baseURL/remove/diagnosis");
    final res = await http.post(_url, body: {
      "id": id ?? "",
    });
    String _message = "(${res.statusCode}) $_url: id:$id";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    }
    return ResponseModel(message: _message);
  }

  // -------------------------- Diagnosis -----------------------------------
  // -------------------------- Investigations -----------------------------------

  Future<InvestigationsResponse> fetchInvestigationList(
    String? doctorID,
    String? specialityID,
    String? search,
  ) async {
    var _url = Uri.parse("$baseURL/investigation/list");
    final res = await http.post(_url, body: {
      "doctor_id": doctorID ?? "",
      "speciality_id": specialityID ?? "",
      "search": search ?? "",
    });
    String _message =
        "(${res.statusCode}) $_url: doctorID:$doctorID, specialityID:$specialityID, search:$search";
    log(_message);

    if (res.statusCode == 200) {
      return InvestigationsResponse.fromJson(json.decode(res.body));
    }
    return InvestigationsResponse(message: _message);
  }

  Future<InvestigationsResponse> addInvestigation(
    String? title,
  ) async {
    var _url = Uri.parse("$baseURL/add/investigations");
    final res = await http.post(_url, body: {
      "title": title ?? "",
    });
    String _message = "(${res.statusCode}) $_url: title:$title";
    log(_message);

    if (res.statusCode == 200) {
      return InvestigationsResponse.fromJson(json.decode(res.body));
    }
    return InvestigationsResponse(message: _message);
  }

  Future<ResponseModel> saveInvestigation(
    String? appointmentID,
    String? investigationID,
    String? fastingState,
    String? duration,
    String? durationType,
    String? notes,
    String? results,
    String? oldID,
  ) async {
    var _url = Uri.parse("$baseURL/save/investigations");
    final res = await http.post(_url, body: {
      "appointment_id": appointmentID ?? "",
      "investigations_id": investigationID ?? "",
      "fasting_state": fastingState ?? "",
      "duration": duration ?? "",
      "duration_type": durationType ?? "",
      "notes": notes ?? "",
      "results": results ?? "",
      "old_id": oldID ?? "",
    });
    String _message =
        "(${res.statusCode}) $_url: appointmentID:$appointmentID, investigationID:$investigationID, fastingState:$fastingState, duration:$duration, durationType:$durationType, notes:$notes, results:$results, oldID:$oldID";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    }
    return ResponseModel(message: _message);
  }

  Future<ResponseModel> removeInvestigation(
    String? id,
  ) async {
    var _url = Uri.parse("$baseURL/remove/investigations");
    final res = await http.post(_url, body: {
      "id": id ?? "",
    });
    String _message = "(${res.statusCode}) $_url: id:$id";
    log(_message);

    if (res.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(res.body));
    }
    return ResponseModel(message: _message);
  }
  // -------------------------- Investigations -----------------------------------
}
