import 'package:aartas_design_system/models/patient_response_model.dart';
import 'package:aartas_design_system/models/timeslot_model.dart';
import 'package:aartas_design_system/models/patient_vitals_model.dart';
import 'package:flutter/material.dart';

class AppointmentResponse extends ChangeNotifier {
  String? message;
  bool? status = false;
  List<AppointmentData>? data = [];

  AppointmentResponse({this.message, this.status, this.data});

  AppointmentResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <AppointmentData>[];
      json['data'].forEach((v) {
        data!.add(AppointmentData.fromJson(v));
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

class AppointmentData {
  int? id;
  // dynamic billId;
  dynamic doctorId;
  dynamic patientId;
  dynamic timeslotId;
  dynamic clinicId;
  dynamic paymentMethod;
  dynamic paymentMethodDetails;
  dynamic payId;
  dynamic appointmentStatus;
  dynamic paymentStatus;
  dynamic consFee;
  dynamic consText;
  dynamic docDiscount;
  dynamic discount;
  dynamic couponId;
  dynamic appointmentType;
  dynamic campId;
  dynamic campDoctorId;
  dynamic procedureId;
  dynamic procedureCost;
  dynamic patientBundlesId;
  dynamic appointmentDate;
  dynamic sGST;
  dynamic cGST;
  dynamic totalAmount;
  // dynamic patientRewardsHistoryId;
  dynamic whatsappSent;
  PatientData? patient;
  Timeslot? timeslot;
  List<PatientVitals>? vitals;

  AppointmentData(
      {this.id,
      // this.billId,
      this.doctorId,
      this.patientId,
      this.timeslotId,
      this.clinicId,
      this.paymentMethod,
      this.paymentMethodDetails,
      this.payId,
      this.appointmentStatus,
      this.paymentStatus,
      this.consFee,
      this.consText,
      this.docDiscount,
      this.discount,
      this.couponId,
      this.appointmentType,
      this.campId,
      this.campDoctorId,
      this.procedureId,
      this.procedureCost,
      this.patientBundlesId,
      this.appointmentDate,
      this.sGST,
      this.cGST,
      this.totalAmount,
      // this.patientRewardsHistoryId,
      this.whatsappSent,
      this.patient,
      this.timeslot,
      this.vitals});

  AppointmentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    // billId = json['bill_id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    timeslotId = json['timeslot_id'];
    clinicId = json['clinic_id'];
    paymentMethod = json['payment_method'];
    paymentMethodDetails = json['payment_method_details'];
    payId = json['pay_id'];
    appointmentStatus = json['appointment_status'];
    paymentStatus = json['payment_status'];
    consFee = json['cons_fee'];
    consText = json['cons_text'];
    docDiscount = json['doc_discount'];
    discount = json['discount'];
    couponId = json['coupon_id'];
    appointmentType = json['appointment_type'];
    campId = json['camp_id'];
    campDoctorId = json['camp_doctor_id'];
    procedureId = json['procedure_id'];
    procedureCost = json['procedure_cost'];
    patientBundlesId = json['patient_bundles_id'];
    appointmentDate = json['appointment_date'];
    sGST = json['SGST'];
    cGST = json['CGST'];
    totalAmount = json['total_amount'];
    // patientRewardsHistoryId = json['patient_rewards_history_id'];
    whatsappSent = json['whatsapp_sent'];
    patient =
        json['patient'] != null ? PatientData.fromJson(json['patient']) : null;
    timeslot =
        json['timeslot'] != null ? Timeslot.fromJson(json['timeslot']) : null;
    if (json['vitals'] != null) {
      vitals = <PatientVitals>[];
      json['vitals'].forEach((v) {
        vitals!.add(PatientVitals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    // data['bill_id'] = billId;
    data['doctor_id'] = doctorId;
    data['patient_id'] = patientId;
    data['timeslot_id'] = timeslotId;
    data['clinic_id'] = clinicId;
    data['payment_method'] = paymentMethod;
    data['payment_method_details'] = paymentMethodDetails;
    data['pay_id'] = payId;
    data['appointment_status'] = appointmentStatus;
    data['payment_status'] = paymentStatus;
    data['cons_fee'] = consFee;
    data['cons_text'] = consText;
    data['doc_discount'] = docDiscount;
    data['discount'] = discount;
    data['coupon_id'] = couponId;
    data['appointment_type'] = appointmentType;
    data['camp_id'] = campId;
    data['camp_doctor_id'] = campDoctorId;
    data['procedure_id'] = procedureId;
    data['procedure_cost'] = procedureCost;
    data['patient_bundles_id'] = patientBundlesId;
    data['appointment_date'] = appointmentDate;
    data['SGST'] = sGST;
    data['CGST'] = cGST;
    data['total_amount'] = totalAmount;
    // data['patient_rewards_history_id'] = patientRewardsHistoryId;
    data['whatsapp_sent'] = whatsappSent;
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    if (timeslot != null) {
      data['timeslot'] = timeslot!.toJson();
    }
    if (vitals != null) {
      data['vitals'] = vitals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
