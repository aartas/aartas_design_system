import 'package:aartas_design_system/models/connect_login_model.dart';
import 'package:aartas_design_system/models/doctor_model.dart';

class ConnectAttendanceDetailsResponse {
  String? message;
  bool? status;
  List<ConnectAttendanceDetailsData>? data;

  ConnectAttendanceDetailsResponse({this.message, this.status, this.data});

  ConnectAttendanceDetailsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ConnectAttendanceDetailsData>[];
      json['data'].forEach((v) {
        data!.add(ConnectAttendanceDetailsData.fromJson(v));
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

class ConnectAttendanceDetailsData {
  int? id;
  int? clinicId;
  int? userId;
  int? patientId;
  int? adminUserId;
  String? visitDate;
  String? checkIn;
  String? checkOut;
  int? purpose;
  String? purposeDetails;
  String? visitCheckoutDetails;
  AdminUser? adminUser;

  ConnectAttendanceDetailsData(
      {this.id,
      this.clinicId,
      this.userId,
      this.patientId,
      this.adminUserId,
      this.visitDate,
      this.checkIn,
      this.checkOut,
      this.purpose,
      this.purposeDetails,
      this.visitCheckoutDetails,
      this.adminUser});

  ConnectAttendanceDetailsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicId = json['clinic_id'];
    userId = json['user_id'];
    patientId = json['patient_id'];
    adminUserId = json['admin_user_id'];
    visitDate = json['visit_date'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    purpose = json['purpose'];
    purposeDetails = json['purpose_details'];
    visitCheckoutDetails = json['visit_checkout_details'];
    adminUser = json['admin_user'] != null
        ? AdminUser.fromJson(json['admin_user'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['clinic_id'] = clinicId;
    data['user_id'] = userId;
    data['patient_id'] = patientId;
    data['admin_user_id'] = adminUserId;
    data['visit_date'] = visitDate;
    data['check_in'] = checkIn;
    data['check_out'] = checkOut;
    data['purpose'] = purpose;
    data['purpose_details'] = purposeDetails;
    data['visit_checkout_details'] = visitCheckoutDetails;
    if (adminUser != null) {
      data['admin_user'] = adminUser!.toJson();
    }
    return data;
  }
}

class AdminUser {
  int? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? password;
  int? role;
  int? clinicId;
  Clinic? clinic;
  Roles? roles;

  AdminUser(
      {this.id,
      this.name,
      this.email,
      this.mobileNumber,
      this.password,
      this.role,
      this.clinicId,
      this.clinic,
      this.roles});

  AdminUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    password = json['password'];
    role = json['role'];
    clinicId = json['clinic_id'];
    clinic = json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null;
    roles = json['roles'] != null ? Roles.fromJson(json['roles']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile_number'] = mobileNumber;
    data['password'] = password;
    data['role'] = role;
    data['clinic_id'] = clinicId;
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
    }
    if (roles != null) {
      data['roles'] = roles!.toJson();
    }
    return data;
  }
}
