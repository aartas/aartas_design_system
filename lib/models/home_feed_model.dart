import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:aartas_design_system/models/speciality_model.dart';

class HomeFeedResponse {
  String? message;
  bool? status;
  HFData? data;

  HomeFeedResponse({this.message, this.status, this.data});

  HomeFeedResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? HFData.fromJson(json['data']) : null;
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

class HFData {
  List<HomeFeed>? homeFeedData;
  String? imageUrl;

  HFData({this.homeFeedData, this.imageUrl});

  HFData.fromJson(Map<String, dynamic> json) {
    if (json['home_feed_data'] != null) {
      homeFeedData = <HomeFeed>[];
      json['home_feed_data'].forEach((v) {
        homeFeedData!.add(HomeFeed.fromJson(v));
      });
    }
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (homeFeedData != null) {
      data['home_feed_data'] = homeFeedData!.map((v) => v.toJson()).toList();
    }
    data['image_url'] = imageUrl;
    return data;
  }
}

class HomeFeed {
  int? id;
  String? title;
  String? description;
  String? image;
  int? isSponsored;
  int? doctorId;
  int? specialityId;
  int? totalLikesCount;
  int? isUserLiked;
  DoctorData? doctor;
  Speciality? speciality;

  HomeFeed({
    this.id,
    this.title,
    this.description,
    this.image,
    this.isSponsored,
    this.doctorId,
    this.specialityId,
    this.totalLikesCount,
    this.isUserLiked,
    this.doctor,
    this.speciality,
  });

  HomeFeed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    isSponsored = json['is_sponsored'];
    doctorId = json['doctor_id'];
    specialityId = json['speciality_id'];
    totalLikesCount = json['total_likes_count'];
    isUserLiked = json['is_user_liked_count'];
    doctor =
        json['doctor'] != null ? DoctorData.fromJson(json['doctor']) : null;
    speciality = json['speciality'] != null
        ? Speciality.fromJson(json['speciality'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['is_sponsored'] = isSponsored;
    data['doctor_id'] = doctorId;
    data['speciality_id'] = specialityId;
    data['total_likes_count'] = totalLikesCount;
    data['is_user_liked_count'] = isUserLiked;
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (speciality != null) {
      data['speciality'] = speciality!.toJson();
    }
    return data;
  }
}
