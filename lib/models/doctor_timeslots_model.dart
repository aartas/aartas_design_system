import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:aartas_design_system/models/clinic_model.dart';

class DoctorTimeslots {
  String? message;
  bool? status;
  List<DoctorTimeslotData>? data;

  DoctorTimeslots({this.message, this.status, this.data});

  DoctorTimeslots.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <DoctorTimeslotData>[];
      json['data'].forEach((v) {
        data!.add(DoctorTimeslotData.fromJson(v));
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

class DoctorTimeslotData {
  int? id;
  int? doctorId;
  String? date;
  String? timeFrom;
  String? timeTo;
  int? clinicId;
  int? clinicRoomsId;
  int? bookingStatus;
  List<AppointmentData>? appointment = [];
  ClinicData? clinic;

  DoctorTimeslotData({
    this.id,
    this.doctorId,
    this.date,
    this.timeFrom,
    this.timeTo,
    this.clinicId,
    this.clinicRoomsId,
    this.bookingStatus,
    this.appointment,
    this.clinic,
  });

  DoctorTimeslotData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    date = json['date'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    clinicId = json['clinic_id'];
    clinicRoomsId = json['clinic_rooms_id'];
    bookingStatus = json['booking_status'];

    if (json['appointment'] != null) {
      appointment = <AppointmentData>[];
      json['appointment'].forEach((v) {
        appointment!.add(AppointmentData.fromJson(v));
      });
    }
    clinic =
        json['clinic'] != null ? ClinicData.fromJson(json['clinic']) : null;
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
    if (appointment != null) {
      data['appointment'] = appointment!.map((v) => v.toJson()).toList();
    }
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
    }
    return data;
  }
}
