import 'package:aartas_design_system/models/doctor_model.dart';

class ConnectLoginResponse {
  String? message;
  bool? status;
  ConnectLoginData? data;

  ConnectLoginResponse({this.message, this.status, this.data});

  ConnectLoginResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data =
        json['data'] != null ? ConnectLoginData.fromJson(json['data']) : null;
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

class ConnectLoginData {
  int? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? password;
  int? role;
  int? clinicId;
  String? aartasId;
  Roles? roles;
  Clinic? clinic;
  String? expiryDate;

  ConnectLoginData({
    this.id,
    this.name,
    this.email,
    this.mobileNumber,
    this.password,
    this.role,
    this.clinicId,
    this.aartasId,
    this.roles,
    this.clinic,
    this.expiryDate,
  });

  ConnectLoginData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    password = json['password'];
    role = json['role'];
    clinicId = json['clinic_id'];
    aartasId = json['aartas_id'];
    expiryDate = json['expiry_date'];
    roles = json['roles'] != null ? Roles.fromJson(json['roles']) : null;
    clinic = json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null;
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
    data['aartas_id'] = aartasId;
    data['expiry_date'] = expiryDate;
    if (roles != null) {
      data['roles'] = roles!.toJson();
    }
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
    }
    return data;
  }
}

class Roles {
  int? id;
  String? title;
  String? permissions;
  String? image;

  Roles({this.id, this.title, this.permissions, this.image});

  Roles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    permissions = json['permissions'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['permissions'] = permissions;
    data['image'] = image;
    return data;
  }
}
