import 'package:aartas_design_system/models/patient_appointment_list_model.dart';

class CheckinQRCodeResponse {
  String? message;
  bool? status;
  Data? data;

  CheckinQRCodeResponse({this.message, this.status, this.data});

  CheckinQRCodeResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  List<PatientAppointmentData>? appointments;
  List<int>? patientToCheckin;

  Data({this.appointments, this.patientToCheckin});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['appointments'] != null) {
      appointments = <PatientAppointmentData>[];
      json['appointments'].forEach((v) {
        appointments!.add(PatientAppointmentData.fromJson(v));
      });
    }
    patientToCheckin = json['patient_to_checkin'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appointments != null) {
      data['appointments'] = appointments!.map((v) => v.toJson()).toList();
    }
    data['patient_to_checkin'] = patientToCheckin;
    return data;
  }
}
