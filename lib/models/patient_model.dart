import 'package:aartas_design_system/models/address_model.dart';

class Patient {
  dynamic id;
  dynamic fullName;
  dynamic phoneCountryCode;
  dynamic phoneNumber;
  dynamic email;
  dynamic gender;
  dynamic pinCode;
  dynamic fcmToken;
  dynamic dob;
  dynamic age;
  dynamic relation;
  dynamic linkId;
  dynamic location;
  dynamic latitude;
  dynamic longitude;
  dynamic membershipTypeId;
  List<Address>? address;

  Patient(
      {this.id,
      this.fullName,
      this.phoneCountryCode,
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
      this.address});

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    phoneCountryCode = json['phone_country_code'];
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
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) {
        address!.add(Address.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['phone_country_code'] = phoneCountryCode;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['gender'] = gender;
    data['fcm_token'] = fcmToken;
    data['dob'] = dob;
    data['age'] = age;
    data['relation'] = relation;
    data['link_id'] = linkId;
    data['membership_type_id'] = membershipTypeId;
    if (address != null) {
      data['address'] = address!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
