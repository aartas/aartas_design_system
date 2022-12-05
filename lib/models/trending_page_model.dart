import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:aartas_design_system/models/home_feed_model.dart';

class TrendingResponse {
  String? message;
  bool? status;
  TrendingData? data;

  TrendingResponse({this.message, this.status, this.data});

  TrendingResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? TrendingData.fromJson(json['data']) : null;
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

class TrendingData {
  List<HomeFeedData>? homeFeedData;
  List<DoctorData>? doctors;
  List<HomeFeedData>? testimonials;
  String? homeFeedImageUrl;
  String? doctorImageUrl;

  TrendingData(
      {this.homeFeedData,
      this.doctors,
      this.testimonials,
      this.homeFeedImageUrl,
      this.doctorImageUrl});

  TrendingData.fromJson(Map<String, dynamic> json) {
    if (json['home_feed_data'] != null) {
      homeFeedData = <HomeFeedData>[];
      json['home_feed_data'].forEach((v) {
        homeFeedData!.add(HomeFeedData.fromJson(v));
      });
    }
    if (json['doctors'] != null) {
      doctors = <DoctorData>[];
      json['doctors'].forEach((v) {
        doctors!.add(DoctorData.fromJson(v));
      });
    }
    if (json['testimonials'] != null) {
      testimonials = <HomeFeedData>[];
      json['testimonials'].forEach((v) {
        testimonials!.add(HomeFeedData.fromJson(v));
      });
    }
    homeFeedImageUrl = json['home_feed_image_url'];
    doctorImageUrl = json['doctor_image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (homeFeedData != null) {
      data['home_feed_data'] = homeFeedData!.map((v) => v.toJson()).toList();
    }
    if (doctors != null) {
      data['doctors'] = doctors!.map((v) => v.toJson()).toList();
    }
    if (testimonials != null) {
      data['testimonials'] = testimonials!.map((v) => v.toJson()).toList();
    }
    data['home_feed_image_url'] = homeFeedImageUrl;
    data['doctor_image_url'] = doctorImageUrl;
    return data;
  }
}
