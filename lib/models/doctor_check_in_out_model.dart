import 'package:aartas_design_system/models/clinic_model.dart';

class DoctorCheckInOutHistory {
  String? message;
  bool? status;
  List<DoctorCheckInOutData>? data;

  DoctorCheckInOutHistory({this.message, this.status, this.data});

  DoctorCheckInOutHistory.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <DoctorCheckInOutData>[];
      json['data'].forEach((v) {
        data!.add(DoctorCheckInOutData.fromJson(v));
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

class DoctorCheckInOutData {
  int? id;
  int? clinicId;
  int? userId;
  int? patientId;
  int? adminUserId;
  int? doctorId;
  String? visitDate;
  String? checkIn;
  String? checkOut;
  int? purpose;
  String? purposeDetails;
  // Null? visitCheckoutDetails;
  ClinicData? clinic;

  DoctorCheckInOutData(
      {this.id,
      this.clinicId,
      this.userId,
      this.patientId,
      this.adminUserId,
      this.doctorId,
      this.visitDate,
      this.checkIn,
      this.checkOut,
      this.purpose,
      this.purposeDetails,
      // this.visitCheckoutDetails,
      this.clinic});

  DoctorCheckInOutData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicId = json['clinic_id'];
    userId = json['user_id'];
    patientId = json['patient_id'];
    adminUserId = json['admin_user_id'];
    doctorId = json['doctor_id'];
    visitDate = json['visit_date'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    purpose = json['purpose'];
    purposeDetails = json['purpose_details'];
    // visitCheckoutDetails = json['visit_checkout_details'];
    clinic =
        json['clinic'] != null ? ClinicData.fromJson(json['clinic']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['clinic_id'] = clinicId;
    data['user_id'] = userId;
    data['patient_id'] = patientId;
    data['admin_user_id'] = adminUserId;
    data['doctor_id'] = doctorId;
    data['visit_date'] = visitDate;
    data['check_in'] = checkIn;
    data['check_out'] = checkOut;
    data['purpose'] = purpose;
    data['purpose_details'] = purposeDetails;
    // data['visit_checkout_details'] = visitCheckoutDetails;
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
    }
    return data;
  }
}
