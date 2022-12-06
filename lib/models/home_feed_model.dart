import 'package:aartas_design_system/models/doctor_model.dart';

class HomeFeedResponse {
  String? message;
  bool? status;
  List<HomeFeedData>? data;

  HomeFeedResponse({this.message, this.status, this.data});

  HomeFeedResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <HomeFeedData>[];
      json['data'].forEach((v) {
        data!.add(HomeFeedData.fromJson(v));
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

class HomeFeedData {
  int? id;
  String? title;
  String? description;
  String? image;
  String? redirectUrl;
  String? alignment;
  String? timeFrom;
  String? timeTo;
  String? location;
  String? latitude;
  String? longitude;
  int? ageFrom;
  int? ageTo;
  String? gender;
  String? platform;
  int? isSponsored;
  int? doctorId;
  DoctorData? doctor;

  HomeFeedData(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.redirectUrl,
      this.alignment,
      this.timeFrom,
      this.timeTo,
      this.location,
      this.latitude,
      this.longitude,
      this.ageFrom,
      this.ageTo,
      this.gender,
      this.platform,
      this.isSponsored,
      this.doctorId,
      this.doctor});

  HomeFeedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    redirectUrl = json['redirect_url'];
    alignment = json['alignment'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    location = json['location'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    ageFrom = json['age_from'];
    ageTo = json['age_to'];
    gender = json['gender'];
    platform = json['platform'];
    isSponsored = json['is_sponsored'];
    doctorId = json['doctor_id'];
    doctor =
        json['doctor'] != null ? DoctorData.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['redirect_url'] = redirectUrl;
    data['alignment'] = alignment;
    data['time_from'] = timeFrom;
    data['time_to'] = timeTo;
    data['location'] = location;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['age_from'] = ageFrom;
    data['age_to'] = ageTo;
    data['gender'] = gender;
    data['platform'] = platform;
    data['is_sponsored'] = isSponsored;
    data['doctor_id'] = doctorId;
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    return data;
  }
}
