class PatientResponse {
  String? message;
  bool? status = false;
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
  //int
  dynamic age;
  // dynamic relation;
  // dynamic linkId;
  // String? location;
  // String? latitude;
  // String? longitude;
  // int? membershipTypeId;
  // String? createdAt;
  // String? updatedAt;
  // dynamic createdBy;
  // dynamic updatedBy;
  // String? status;

  PatientData({
    this.id,
    this.fullName,
    this.phoneNumber,
    this.email,
    this.gender,
    this.dob,
    this.age,
    // this.phoneCountryCode,
    // this.pinCode,
    this.fcmToken,
    // this.relation,
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
  });

  PatientData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    gender = json['gender'];
    dob = json['dob'];
    age = json['age'];
    // phoneCountryCode = json['phone_country_code'];
    // pinCode = json['pin_code'];
    fcmToken = json['fcm_token'];
    // relation = json['relation'];
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['gender'] = gender;
    data['dob'] = dob;
    data['age'] = age;
    // data['phone_country_code'] = phoneCountryCode;
    // data['pin_code'] = pinCode;
    data['fcm_token'] = fcmToken;
    // data['relation'] = relation;
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
    return data;
  }
}
