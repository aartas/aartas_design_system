class RewardTypeListResponse {
  String? message;
  bool? status;
  List<RewardTypeListData>? data;

  RewardTypeListResponse({this.message, this.status, this.data});

  RewardTypeListResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <RewardTypeListData>[];
      json['data'].forEach((v) {
        data!.add(RewardTypeListData.fromJson(v));
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

class RewardTypeListData {
  int? id;
  String? title;
  String? details;
  String? criteria;
  int? status;

  RewardTypeListData(
      {this.id, this.title, this.details, this.criteria, this.status});

  RewardTypeListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    details = json['details'];
    criteria = json['criteria'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['details'] = details;
    data['criteria'] = criteria;
    data['status'] = status;
    return data;
  }
}
