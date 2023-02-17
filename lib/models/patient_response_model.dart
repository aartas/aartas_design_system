import 'package:aartas_design_system/models/confirm_appointment_model.dart';

class PatientResponse {
  String? message;
  bool? status;
  List<PatientData>? data;

  PatientResponse({this.message, this.status, this.data});

  PatientResponse.fromJson(Map<String, dynamic> json) {
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

class PatientData {
  int? id;
  String? fullName;
  // String? phoneCountryCode;
  String? phoneNumber;
  String? email;
  String? gender;
  // String? pinCode;
  String? fcmToken;
  String? dob;
  int? age;
  String? relation;
  // Null? linkId;
  // String? location;
  // String? latitude;
  // String? longitude;
  // int? membershipTypeId;
  // String? createdAt;
  // String? updatedAt;
  // Null? createdBy;
  // Null? updatedBy;
  // String? status;
  Membership? membership;
  CheckInDetails? checkInDetails;
  AppointmentData? lastAppointment;

  PatientData({
    this.id,
    this.fullName,
    // this.phoneCountryCode,
    this.phoneNumber,
    this.email,
    this.gender,
    // this.pinCode,
    this.fcmToken,
    this.dob,
    this.age,
    this.relation,
    // this.linkId,
    // this.location,
    // this.latitude,
    // this.longitude,
    // this.membershipTypeId,
    // this.createdAt,
    // this.updatedAt,
    // this.createdBy,
    // this.updatedBy,
    // this.status,
    this.membership,
    this.checkInDetails,
    this.lastAppointment,
  });

  PatientData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    // phoneCountryCode = json['phone_country_code'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    gender = json['gender'];
    // pinCode = json['pin_code'];
    fcmToken = json['fcm_token'];
    dob = json['dob'];
    age = json['age'];
    relation = json['relation'];
    // linkId = json['link_id'];
    // location = json['location'];
    // latitude = json['latitude'];
    // longitude = json['longitude'];
    // membershipTypeId = json['membership_type_id'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // createdBy = json['created_by'];
    // updatedBy = json['updated_by'];
    // status = json['status'];
    membership = json['membership'] != null
        ? Membership.fromJson(json['membership'])
        : null;
    checkInDetails = json['check_in_details'] != null
        ? CheckInDetails.fromJson(json['check_in_details'])
        : null;
    lastAppointment = json['last_appointment'] != null
        ? AppointmentData.fromJson(json['last_appointment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    // data['phone_country_code'] = phoneCountryCode;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['gender'] = gender;
    // data['pin_code'] = pinCode;
    data['fcm_token'] = fcmToken;
    data['dob'] = dob;
    data['age'] = age;
    data['relation'] = relation;
    // data['link_id'] = linkId;
    // data['location'] = location;
    // data['latitude'] = latitude;
    // data['longitude'] = longitude;
    // data['membership_type_id'] = membershipTypeId;
    // data['created_at'] = createdAt;
    // data['updated_at'] = updatedAt;
    // data['created_by'] = createdBy;
    // data['updated_by'] = updatedBy;
    // data['status'] = status;
    if (membership != null) {
      data['membership'] = membership!.toJson();
    }
    if (checkInDetails != null) {
      data['check_in_details'] = checkInDetails!.toJson();
    }
    if (lastAppointment != null) {
      data['last_appointment'] = lastAppointment!.toJson();
    }
    return data;
  }
}

class Membership {
  int? id;
  String? title;
  String? details;
  String? criteria;
  // String? createdAt;
  // String? updatedAt;
  // Null? createdBy;
  // Null? updatedBy;
  int? status;

  Membership(
      {this.id,
      this.title,
      this.details,
      this.criteria,
      // this.createdAt,
      // this.updatedAt,
      // this.createdBy,
      // this.updatedBy,
      this.status});

  Membership.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    details = json['details'];
    criteria = json['criteria'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
    // createdBy = json['created_by'];
    // updatedBy = json['updated_by'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['details'] = details;
    data['criteria'] = criteria;
    // data['created_at'] = createdAt;
    // data['updated_at'] = updatedAt;
    // data['created_by'] = createdBy;
    // data['updated_by'] = updatedBy;
    data['status'] = status;
    return data;
  }
}

class CheckInDetails {
  int? id;
  int? clinicId;
  int? userId;
  int? patientId;
  String? visitDate;
  String? checkIn;
  String? checkOut;
  int? purpose;
  String? purposeDetails;
  String? visitCheckoutDetails;
  int? status;

  CheckInDetails(
      {this.id,
      this.clinicId,
      this.userId,
      this.patientId,
      this.visitDate,
      this.checkIn,
      this.checkOut,
      this.purpose,
      this.purposeDetails,
      this.visitCheckoutDetails,
      this.status});

  CheckInDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicId = json['clinic_id'];
    userId = json['user_id'];
    patientId = json['patient_id'];
    visitDate = json['visit_date'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    purpose = json['purpose'];
    purposeDetails = json['purpose_details'];
    visitCheckoutDetails = json['visit_checkout_details'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['clinic_id'] = clinicId;
    data['user_id'] = userId;
    data['patient_id'] = patientId;
    data['visit_date'] = visitDate;
    data['check_in'] = checkIn;
    data['check_out'] = checkOut;
    data['purpose'] = purpose;
    data['purpose_details'] = purposeDetails;
    data['visit_checkout_details'] = visitCheckoutDetails;
    data['status'] = status;
    return data;
  }
}
