import 'package:aartas_design_system/models/appointment_model.dart';

class PatientVitalsReponse {
  String? message;
  bool? status;
  PatientVitalsData? data;

  PatientVitalsReponse({this.message, this.status, this.data});

  PatientVitalsReponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data =
        json['data'] != null ? PatientVitalsData.fromJson(json['data']) : null;
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

class PatientVitalsData {
  List<Vitals>? vitals;

  PatientVitalsData({this.vitals});

  PatientVitalsData.fromJson(Map<String, dynamic> json) {
    if (json['vitals'] != null) {
      vitals = <Vitals>[];
      json['vitals'].forEach((v) {
        vitals!.add(Vitals.fromJson(v));
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
