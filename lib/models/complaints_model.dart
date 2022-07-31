import 'package:aartas_design_system/models/appointment_model.dart';

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
  List<Complaint>? complaints;

  ComplaintsResponseData({this.complaints});

  ComplaintsResponseData.fromJson(Map<String, dynamic> json) {
    if (json['complaints'] != null) {
      complaints = <Complaint>[];
      json['complaints'].forEach((v) {
        complaints!.add(Complaint.fromJson(v));
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
