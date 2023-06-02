class VisitPurposeListResponse {
  String? message;
  bool? status;
  List<VisitPurposeData>? data;

  VisitPurposeListResponse({this.message, this.status, this.data});

  VisitPurposeListResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <VisitPurposeData>[];
      json['data'].forEach((v) {
        data!.add(VisitPurposeData.fromJson(v));
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

class VisitPurposeData {
  int? id;
  String? title;

  VisitPurposeData({this.id, this.title});

  VisitPurposeData.fromJson(Map<String, dynamic> json) {
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
