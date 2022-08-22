import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:aartas_design_system/models/family_members_model.dart';
import 'package:aartas_design_system/models/home_feed_model.dart';
import 'package:aartas_design_system/models/timeslot_model.dart';

class ConfirmAppointment {
  String? message;
  bool? status;
  ConfirmAppointmentData? data;

  ConfirmAppointment({this.message, this.status, this.data});

  ConfirmAppointment.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? ConfirmAppointmentData.fromJson(json['data'])
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

class ConfirmAppointmentData {
  AppointmentData? appointmentData;
  List<DoctorData>? suggestedDoctors;
  List<HomeFeed>? homeFeedData;

  ConfirmAppointmentData(
      {this.appointmentData, this.suggestedDoctors, this.homeFeedData});

  ConfirmAppointmentData.fromJson(Map<String, dynamic> json) {
    appointmentData = json['appointment_data'] != null
        ? AppointmentData.fromJson(json['appointment_data'])
        : null;
    if (json['suggested_doctors'] != null) {
      suggestedDoctors = <DoctorData>[];
      json['suggested_doctors'].forEach((v) {
        suggestedDoctors!.add(DoctorData.fromJson(v));
      });
    }
    if (json['home_feed_data'] != null) {
      homeFeedData = <HomeFeed>[];
      json['home_feed_data'].forEach((v) {
        homeFeedData!.add(HomeFeed.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (appointmentData != null) {
      data['appointment_data'] = appointmentData!.toJson();
    }
    if (suggestedDoctors != null) {
      data['suggested_doctors'] =
          suggestedDoctors!.map((v) => v.toJson()).toList();
    }
    if (homeFeedData != null) {
      data['home_feed_data'] = homeFeedData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AppointmentData {
  int? id;
  int? doctorId;
  int? patientId;
  int? timeslotId;
  int? appointmentStatus;
  int? paymentStatus;
  int? couponId;
  int? status;
  FamilyMemberData? patient;
  Timeslot? timeslot;
  DoctorData? doctor;

  AppointmentData({
    this.id,
    this.doctorId,
    this.patientId,
    this.timeslotId,
    this.appointmentStatus,
    this.paymentStatus,
    this.couponId,
    this.status,
    this.patient,
    this.timeslot,
    this.doctor,
  });

  AppointmentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    timeslotId = json['timeslot_id'];
    appointmentStatus = json['appointment_status'];
    paymentStatus = json['payment_status'];
    couponId = json['coupon_id'];
    status = json['status'];
    patient = json['patient'] != null
        ? FamilyMemberData.fromJson(json['patient'])
        : null;
    timeslot =
        json['timeslot'] != null ? Timeslot.fromJson(json['timeslot']) : null;
    doctor =
        json['doctor'] != null ? DoctorData.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['patient_id'] = patientId;
    data['timeslot_id'] = timeslotId;
    data['appointment_status'] = appointmentStatus;
    data['payment_status'] = paymentStatus;
    data['coupon_id'] = couponId;
    data['status'] = status;
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    if (timeslot != null) {
      data['timeslot'] = timeslot!.toJson();
    }
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    return data;
  }
}
