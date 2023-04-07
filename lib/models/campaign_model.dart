import 'package:aartas_design_system/models/coupon_model.dart';

class CampaignResponse {
  String? message;
  bool? status;
  CampaignData? data;

  CampaignResponse({this.message, this.status, this.data});

  CampaignResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? CampaignData.fromJson(json['data']) : null;
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

class CampaignData {
  int? id;
  String? title;
  String? slug;
  String? description;
  int? type;
  int? couponId;
  String? expiryDate;
  Coupon? coupon;

  CampaignData(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.type,
      this.couponId,
      this.expiryDate,
      this.coupon});

  CampaignData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    type = json['type'];
    couponId = json['coupon_id'];
    expiryDate = json['expiry_date'];
    coupon = json['coupon'] != null ? Coupon.fromJson(json['coupon']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['type'] = type;
    data['coupon_id'] = couponId;
    data['expiry_date'] = expiryDate;
    if (coupon != null) {
      data['coupon'] = coupon!.toJson();
    }
    return data;
  }
}
