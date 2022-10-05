class MembershipResponse {
  String? message;
  bool? status;
  MembershipData? data;

  MembershipResponse({this.message, this.status, this.data});

  MembershipResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? MembershipData.fromJson(json['data']) : null;
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

class MembershipData {
  UserCountData? userCountData;

  MembershipData({
    this.userCountData,
  });

  MembershipData.fromJson(Map<String, dynamic> json) {
    userCountData = json['user_count_data'] != null
        ? UserCountData.fromJson(json['user_count_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (userCountData != null) {
      data['user_count_data'] = userCountData!.toJson();
    }

    return data;
  }
}

class UserCountData {
  int? totalPoints;
  int? totalConsultation;
  int? totalSpecialityCount;
  int? totalAmountConsultation;

  UserCountData({
    this.totalPoints,
    this.totalConsultation,
    this.totalSpecialityCount,
    this.totalAmountConsultation,
  });

  UserCountData.fromJson(Map<String, dynamic> json) {
    totalPoints = json['total_points'];
    totalConsultation = json['total_consultation'];
    totalSpecialityCount = json['total_speciality_count'];
    totalAmountConsultation = json['total_amount_consultation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_points'] = totalPoints;
    data['total_consultation'] = totalConsultation;
    data['total_speciality_count'] = totalSpecialityCount;
    data['total_amount_consultation'] = totalAmountConsultation;
    return data;
  }
}

class LoginData {
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
  String? linkId;
  String? location;
  String? latitude;
  String? longitude;
  int? membershipTypeId;
  String? status;
  Membership? membership;

  LoginData(
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
      this.location,
      this.latitude,
      this.longitude,
      this.membershipTypeId,
      this.status,
      this.membership});

  LoginData.fromJson(Map<String, dynamic> json) {
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
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    membershipTypeId = json['membership_type_id'];
    status = json['status'];
    membership = json['membership'] != null
        ? Membership.fromJson(json['membership'])
        : null;
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
    data['location'] = location;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['membership_type_id'] = membershipTypeId;
    data['status'] = status;
    if (membership != null) {
      data['membership'] = membership!.toJson();
    }
    return data;
  }
}

class Membership {
  int? id;
  String? title;
  String? details;
  String? criteria;
  String? createdAt;
  int? status;

  Membership({
    this.id,
    this.title,
    this.details,
    this.criteria,
    this.createdAt,
    this.status,
  });

  Membership.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    details = json['details'];
    criteria = json['criteria'];
    createdAt = json['created_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['details'] = details;
    data['criteria'] = criteria;
    data['created_at'] = createdAt;
    data['status'] = status;
    return data;
  }
}
