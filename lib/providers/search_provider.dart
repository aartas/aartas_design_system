import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:aartas_design_system/models/patient_response_model.dart';

class SearchResponse {
  String? message;
  bool? status;
  SearchData? data;

  SearchResponse({this.message, this.status, this.data});

  SearchResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? SearchData.fromJson(json['data']) : null;
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

class SearchData {
  List<AppointmentData>? appointments;
  List<PatientData>? patients;
  List<DoctorData>? doctors;

  SearchData({this.appointments, this.patients, this.doctors});

  SearchData.fromJson(Map<String, dynamic> json) {
    if (json['appointments'] != null) {
      appointments = <AppointmentData>[];
      json['appointments'].forEach((v) {
        appointments!.add(AppointmentData.fromJson(v));
      });
    }
    if (json['patients'] != null) {
      patients = <PatientData>[];
      json['patients'].forEach((v) {
        patients!.add(PatientData.fromJson(v));
      });
    }
    if (json['doctors'] != null) {
      doctors = <DoctorData>[];
      json['doctors'].forEach((v) {
        doctors!.add(DoctorData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appointments != null) {
      data['appointments'] = appointments!.map((v) => v.toJson()).toList();
    }
    if (patients != null) {
      data['patients'] = patients!.map((v) => v.toJson()).toList();
    }
    if (doctors != null) {
      data['doctors'] = doctors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
