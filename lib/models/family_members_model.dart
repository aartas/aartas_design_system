class FamilyMemberResponse {
  String? message;
  bool? status = false;
  List<FamilyMemberData>? data = [];

  FamilyMemberResponse({this.message, this.status, this.data});

  FamilyMemberResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <FamilyMemberData>[];
      json['data'].forEach((v) {
        data!.add(FamilyMemberData.fromJson(v));
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

class FamilyMemberData {
  int? id;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? gender;
  String? pinCode;
  String? fcmToken;
  String? dob;
  int? age;
  String? relation;
  int? linkId;
  String? createdAt;
  String? updatedAt;
  String? status;

  FamilyMemberData(
      {this.id,
      this.fullName,
      this.phoneNumber,
      this.email,
      this.gender,
      this.pinCode,
      this.fcmToken,
      this.dob,
      this.age,
      this.relation,
      this.linkId,
      this.createdAt,
      this.updatedAt,
      this.status});

  FamilyMemberData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    gender = json['gender'];
    pinCode = json['pin_code'];
    fcmToken = json['fcm_token'];
    dob = json['dob'];
    age = json['age'];
    relation = json['relation'];
    linkId = json['link_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['gender'] = gender;
    data['pin_code'] = pinCode;
    data['fcm_token'] = fcmToken;
    data['dob'] = dob;
    data['age'] = age;
    data['relation'] = relation;
    data['link_id'] = linkId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    return data;
  }
}
