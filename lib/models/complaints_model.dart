class ComplaintResponse {
  String? message;
  bool? status;
  ComplaintResponseData? data;

  ComplaintResponse({this.message, this.status, this.data});

  ComplaintResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? ComplaintResponseData.fromJson(json['data'])
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

class ComplaintResponseData {
  List<ComplaintsData>? complaints;

  ComplaintResponseData({this.complaints});

  ComplaintResponseData.fromJson(Map<String, dynamic> json) {
    if (json['complaints'] != null) {
      complaints = <ComplaintsData>[];
      json['complaints'].forEach((v) {
        complaints!.add(ComplaintsData.fromJson(v));
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

class ComplaintsData {
  int? id;
  String? title;

  ComplaintsData({this.id, this.title});

  ComplaintsData.fromJson(Map<String, dynamic> json) {
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
