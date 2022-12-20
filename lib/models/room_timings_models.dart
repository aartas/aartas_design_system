import 'package:aartas_design_system/models/clinic_model.dart';
import 'package:aartas_design_system/models/doctor_model.dart';

class RoomTimingsResponse {
  String? message;
  bool? status;
  List<RoomTimingData>? data;

  RoomTimingsResponse({this.message, this.status, this.data});

  RoomTimingsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <RoomTimingData>[];
      json['data'].forEach((v) {
        data!.add(RoomTimingData.fromJson(v));
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

class RoomTimingData {
  int? id;
  int? doctorId;
  String? scheduleDays;
  String? scheduleTimings;
  dynamic timePerPatient;
  int? clinicId;
  int? clinicRoomsId;
  DoctorData? doctor;
  ClinicData? clincDetails;
  RoomDetails? roomDetails;

  RoomTimingData(
      {this.id,
      this.doctorId,
      this.scheduleDays,
      this.scheduleTimings,
      this.timePerPatient,
      this.clinicId,
      this.clinicRoomsId,
      this.doctor,
      this.clincDetails,
      this.roomDetails});

  RoomTimingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    scheduleDays = json['scheduleDays'];
    scheduleTimings = json['scheduleTimings'];
    timePerPatient = json['time_per_patient'];
    clinicId = json['clinic_id'];
    clinicRoomsId = json['clinic_rooms_id'];
    doctor =
        json['doctor'] != null ? DoctorData.fromJson(json['doctor']) : null;
    clincDetails = json['clinc_details'] != null
        ? ClinicData.fromJson(json['clinc_details'])
        : null;
    roomDetails = json['room_details'] != null
        ? RoomDetails.fromJson(json['room_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['scheduleDays'] = scheduleDays;
    data['scheduleTimings'] = scheduleTimings;
    data['time_per_patient'] = timePerPatient;
    data['clinic_id'] = clinicId;
    data['clinic_rooms_id'] = clinicRoomsId;
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (clincDetails != null) {
      data['clinc_details'] = clincDetails!.toJson();
    }
    if (roomDetails != null) {
      data['room_details'] = roomDetails!.toJson();
    }
    return data;
  }
}

class RoomDetails {
  int? id;
  int? clinicId;
  String? roomNumber;
  int? roomType;
  String? mapImage;
  List<CheckIfBeingUsed>? checkIfBeingUsed;

  RoomDetails(
      {this.id,
      this.clinicId,
      this.roomNumber,
      this.roomType,
      this.mapImage,
      this.checkIfBeingUsed});

  RoomDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicId = json['clinic_id'];
    roomNumber = json['room_number'];
    roomType = json['room_type'];
    mapImage = json['map_image'];
    if (json['check_if_being_used'] != null) {
      checkIfBeingUsed = <CheckIfBeingUsed>[];
      json['check_if_being_used'].forEach((v) {
        checkIfBeingUsed!.add(CheckIfBeingUsed.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['clinic_id'] = clinicId;
    data['room_number'] = roomNumber;
    data['room_type'] = roomType;
    data['map_image'] = mapImage;
    if (checkIfBeingUsed != null) {
      data['check_if_being_used'] =
          checkIfBeingUsed!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CheckIfBeingUsed {
  int? id;
  int? doctorId;
  int? clinicId;
  int? roomId;
  String? loginTime;
  String? logoutTime;
  String? date;

  CheckIfBeingUsed(
      {this.id,
      this.doctorId,
      this.clinicId,
      this.roomId,
      this.loginTime,
      this.logoutTime,
      this.date});

  CheckIfBeingUsed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    clinicId = json['clinic_id'];
    roomId = json['room_id'];
    loginTime = json['login_time'];
    logoutTime = json['logout_time'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['clinic_id'] = clinicId;
    data['room_id'] = roomId;
    data['login_time'] = loginTime;
    data['logout_time'] = logoutTime;
    data['date'] = date;
    return data;
  }
}
