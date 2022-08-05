class SearchCategoryResponse {
  String? message;
  bool? status = false;
  SearchCategoryDataList? data;

  SearchCategoryResponse({this.message, this.status, this.data});

  SearchCategoryResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? SearchCategoryDataList.fromJson(json['data'])
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

class SearchCategoryDataList {
  List<SearchCategoryData>? complaints;

  SearchCategoryDataList({this.complaints});

  SearchCategoryDataList.fromJson(Map<String, dynamic> json) {
    if (json['complaints'] != null) {
      complaints = <SearchCategoryData>[];
      json['complaints'].forEach((v) {
        complaints!.add(SearchCategoryData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (complaints != null) {
      data['complaints'] = complaints!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchCategoryData {
  int? id;
  String? title;

  SearchCategoryData({this.id, this.title});

  SearchCategoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
