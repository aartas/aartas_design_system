import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:aartas_design_system/models/patient_vitals_model.dart';

class VitalsResponse {
  String? message;
  bool? status;
  VitalListData? data;

  VitalsResponse({this.message, this.status, this.data});

  VitalsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? VitalListData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class VitalListData {
  List<Vital>? vitals;

  VitalListData({this.vitals});

  VitalListData.fromJson(Map<String, dynamic> json) {
    if (json['vitals'] != null) {
      vitals = <Vital>[];
      json['vitals'].forEach((v) {
        vitals!.add(Vital.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vitals != null) {
      data['vitals'] = vitals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
