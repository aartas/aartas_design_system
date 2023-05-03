import 'package:aartas_design_system/models/patient_response_model.dart';

class FamilyMemberResponse {
  String? message;
  bool? status = false;
  List<PatientData>? data = [];

  FamilyMemberResponse({this.message, this.status, this.data});

  FamilyMemberResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <PatientData>[];
      json['data'].forEach((v) {
        data!.add(PatientData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
