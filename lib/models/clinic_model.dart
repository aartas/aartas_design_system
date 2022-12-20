import 'package:aartas_design_system/models/timeslot_model.dart';

class ClinicsResponse {
  String? message;
  bool? status;
  List<ClinicData>? data;

  ClinicsResponse({this.message, this.status, this.data});

  ClinicsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ClinicData>[];
      json['data'].forEach((v) {
        data!.add(ClinicData.fromJson(v));
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

class ClinicData {
  int? id;
  String? title;
  String? address;
  int? totalRoooms;
  String? phoneNumber;
  String? gSTIN;
  String? stateCode;
  String? ipAddressList;
  String? latitude;
  String? longitude;
  List<Room>? rooms;

  ClinicData(
      {this.id,
      this.title,
      this.address,
      this.totalRoooms,
      this.phoneNumber,
      this.gSTIN,
      this.stateCode,
      this.ipAddressList,
      this.latitude,
      this.longitude,
      this.rooms});

  ClinicData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    totalRoooms = json['total_roooms'];
    phoneNumber = json['phone_number'];
    gSTIN = json['GSTIN'];
    stateCode = json['state_code'];
    ipAddressList = json['ip_address_list'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    if (json['rooms'] != null) {
      rooms = <Room>[];
      json['rooms'].forEach((v) {
        rooms!.add(Room.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['address'] = address;
    data['total_roooms'] = totalRoooms;
    data['phone_number'] = phoneNumber;
    data['GSTIN'] = gSTIN;
    data['state_code'] = stateCode;
    data['ip_address_list'] = ipAddressList;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    if (rooms != null) {
      data['rooms'] = rooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
