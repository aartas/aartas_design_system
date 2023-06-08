class VisitUserResponse {
  String? message;
  bool? status;
  VisitUserData? data;

  VisitUserResponse({this.message, this.status, this.data});

  VisitUserResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? VisitUserData.fromJson(json['data']) : null;
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

class VisitUserData {
  int? id;
  String? name;
  String? email;
  String? phoneNumber;
  int? role;
  String? emailVerifiedAt;

  VisitUserData({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.role,
    this.emailVerifiedAt,
  });

  VisitUserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    role = json['role'];
    emailVerifiedAt = json['email_verified_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['role'] = role;
    data['email_verified_at'] = emailVerifiedAt;

    return data;
  }
}
