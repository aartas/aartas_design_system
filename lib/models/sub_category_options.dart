class SubCategoryOptions {
  String? message;
  bool? status;
  List<SubCategoryOptionsData>? data;

  SubCategoryOptions({this.message, this.status, this.data});

  SubCategoryOptions.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <SubCategoryOptionsData>[];
      json['data'].forEach((v) {
        data!.add(SubCategoryOptionsData.fromJson(v));
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

class SubCategoryOptionsData {
  int? id;
  int? subCategoryId;
  String? title;

  SubCategoryOptionsData({this.id, this.subCategoryId, this.title});

  SubCategoryOptionsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subCategoryId = json['sub_category_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sub_category_id'] = subCategoryId;
    data['title'] = title;
    return data;
  }
}
