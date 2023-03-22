class QuickActionResponse {
  String? message;
  bool? status;
  QuickActionData? data;

  QuickActionResponse({this.message, this.status, this.data});

  QuickActionResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? QuickActionData.fromJson(json['data']) : null;
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

class QuickActionData {
  String? title;
  String? doctorId;
  String? categoryId;
  String? updatedAt;
  String? createdAt;
  int? id;

  QuickActionData(
      {this.title,
      this.doctorId,
      this.categoryId,
      this.updatedAt,
      this.createdAt,
      this.id});

  QuickActionData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    doctorId = json['doctor_id'];
    categoryId = json['category_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['doctor_id'] = doctorId;
    data['category_id'] = categoryId;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
