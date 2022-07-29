class ComplaintsResponse {
  String? message;
  bool? status;
  ComplaintsResponseData? data;

  ComplaintsResponse({this.message, this.status, this.data});

  ComplaintsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? ComplaintsResponseData.fromJson(json['data'])
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

class ComplaintsResponseData {
  List<Complaints>? complaints;

  ComplaintsResponseData({this.complaints});

  ComplaintsResponseData.fromJson(Map<String, dynamic> json) {
    if (json['complaints'] != null) {
      complaints = <Complaints>[];
      json['complaints'].forEach((v) {
        complaints!.add(Complaints.fromJson(v));
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

class Complaints {
  int? id;
  String? title;

  Complaints({this.id, this.title});

  Complaints.fromJson(Map<String, dynamic> json) {
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
