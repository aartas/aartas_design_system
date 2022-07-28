class SearchCategoryList {
  String? message;
  bool? status;
  Data? data;

  SearchCategoryList({this.message, this.status, this.data});

  SearchCategoryList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  List<SearchContentData>? complaints;

  Data({this.complaints});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['complaints'] != null) {
      complaints = <SearchContentData>[];
      json['complaints'].forEach((v) {
        complaints!.add(SearchContentData.fromJson(v));
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

class SearchContentData {
  int? id;
  String? title;

  SearchContentData({this.id, this.title});

  SearchContentData.fromJson(Map<String, dynamic> json) {
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
