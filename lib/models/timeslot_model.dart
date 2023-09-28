import 'package:aartas_design_system/models/clinic_model.dart';
import 'package:aartas_design_system/models/doctor_model.dart';

class Timeslot {
  int? id;
  int? doctorId;
  String? date;
  String? timeFrom;
  String? timeTo;
  int? clinicId;
  int? clinicRoomsId;
  int? bookingStatus;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;
  int? status;
  ClinicData? clinic;
  Room? room;

  Timeslot(
      {this.id,
      this.doctorId,
      this.date,
      this.timeFrom,
      this.timeTo,
      this.clinicId,
      this.clinicRoomsId,
      this.bookingStatus,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.status,
      this.clinic,
      this.room});

  Timeslot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    date = json['date'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    clinicId = json['clinic_id'];
    clinicRoomsId = json['clinic_rooms_id'];
    bookingStatus = json['booking_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    status = json['status'];
    clinic =
        json['clinic'] != null ? ClinicData.fromJson(json['clinic']) : null;
    room = json['room'] != null ? Room.fromJson(json['room']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['date'] = date;
    data['time_from'] = timeFrom;
    data['time_to'] = timeTo;
    data['clinic_id'] = clinicId;
    data['clinic_rooms_id'] = clinicRoomsId;
    data['booking_status'] = bookingStatus;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['status'] = status;
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
    }
    if (room != null) {
      data['room'] = room!.toJson();
    }
    return data;
  }
}

class Room {
  int? id;
  int? clinicId;
  String? roomNumber;
  int? roomType;
  String? mapImage;
  int? status;

  Room(
      {this.id,
      this.clinicId,
      this.roomNumber,
      this.roomType,
      this.mapImage,
      this.status});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicId = json['clinic_id'];
    roomNumber = json['room_number'];
    roomType = json['room_type'];
    mapImage = json['map_image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['clinic_id'] = clinicId;
    data['room_number'] = roomNumber;
    data['room_type'] = roomType;
    data['map_image'] = mapImage;
    data['status'] = status;
    return data;
  }
}
