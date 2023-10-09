class AddCategoryResponse {
  String? message;
  bool? status;
  AddCategoryResponseData? data;

  AddCategoryResponse({this.message, this.status, this.data});

  AddCategoryResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? AddCategoryResponseData.fromJson(json['data'])
        : null;
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

class AddCategoryResponseData {
  String? title;
  String? updatedAt;
  String? createdAt;
  int? id;

  AddCategoryResponseData(
      {this.title, this.updatedAt, this.createdAt, this.id});

  AddCategoryResponseData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}
