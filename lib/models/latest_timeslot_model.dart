import 'package:aartas_design_system/models/timeslot_model.dart';

class LatestTimeslotResponse {
  String? message;
  bool? status;
  Timeslot? data;

  LatestTimeslotResponse({this.message, this.status, this.data});

  LatestTimeslotResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? Timeslot.fromJson(json['data']) : null;
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
