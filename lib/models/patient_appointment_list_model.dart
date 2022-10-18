import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:aartas_design_system/models/timeslot_model.dart';

class PatientAppointmentResponse {
  String? message;
  bool? status;
  List<PatientAppointmentData>? data;

  PatientAppointmentResponse({this.message, this.status, this.data});

  PatientAppointmentResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <PatientAppointmentData>[];
      json['data'].forEach((v) {
        data!.add(PatientAppointmentData.fromJson(v));
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

class PatientAppointmentData {
  int? id;
  int? doctorId;
  int? patientId;
  int? timeslotId;
  int? clinicId;
  String? paymentMethod;
  String? paymentMethodDetails;
  String? payId;
  int? appointmentStatus;
  int? paymentStatus;
  String? consFee;
  int? showConsFee;
  String? consText;
  String? docDiscount;
  String? discount;
  String? couponId;
  int? appointmentType;
  String? campId;
  String? campDoctorId;
  String? procedureId;
  String? procedureCost;
  String? patientBundlesId;
  String? appointmentDate;
  String? sGST;
  String? cGST;
  String? totalAmount;
  int? patientRewardsHistoryId;
  int? whatsappSent;
  int? isConfirmed;
  String? prescriptionFile;
  String? billFile;
  String? consStartTime;
  String? consEndTime;
  String? followUpDate;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;
  int? status;
  DoctorData? doctor;
  Patient? patient;
  Timeslot? timeslot;
  List<Vitals>? vitals;
  List<AppointmentsMedicines>? appointmentsMedicines;

  PatientAppointmentData({
    this.id,
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
    this.showConsFee,
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
    this.patientRewardsHistoryId,
    this.whatsappSent,
    this.isConfirmed,
    this.prescriptionFile,
    this.billFile,
    this.consStartTime,
    this.consEndTime,
    this.followUpDate,
    this.createdAt,
    this.updatedAt,
    this.createdBy,
    this.updatedBy,
    this.status,
    this.doctor,
    this.patient,
    this.timeslot,
    this.vitals,
    this.appointmentsMedicines,
  });

  PatientAppointmentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    showConsFee = json['show_cons_fee'];
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
    patientRewardsHistoryId = json['patient_rewards_history_id'];
    whatsappSent = json['whatsapp_sent'];
    isConfirmed = json['is_confirmed'];
    prescriptionFile = json['prescription_file'];
    billFile = json['bill_file'];
    consStartTime = json['cons_start_time'];
    consEndTime = json['cons_end_time'];
    followUpDate = json['follow_up_date'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    status = json['status'];
    doctor =
        json['doctor'] != null ? DoctorData.fromJson(json['doctor']) : null;
    patient =
        json['patient'] != null ? Patient.fromJson(json['patient']) : null;
    timeslot =
        json['timeslot'] != null ? Timeslot.fromJson(json['timeslot']) : null;
    if (json['vitals'] != null) {
      vitals = <Vitals>[];
      json['vitals'].forEach((v) {
        vitals!.add(Vitals.fromJson(v));
      });
    }
    if (json['appointments_medicines'] != null) {
      appointmentsMedicines = <AppointmentsMedicines>[];
      json['appointments_medicines'].forEach((v) {
        appointmentsMedicines!.add(AppointmentsMedicines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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
    data['show_cons_fee'] = showConsFee;
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
    data['patient_rewards_history_id'] = patientRewardsHistoryId;
    data['whatsapp_sent'] = whatsappSent;
    data['is_confirmed'] = isConfirmed;
    data['prescription_file'] = prescriptionFile;
    data['bill_file'] = billFile;
    data['cons_start_time'] = consStartTime;
    data['cons_end_time'] = consEndTime;
    data['follow_up_date'] = followUpDate;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['status'] = status;
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (patient != null) {
      data['patient'] = patient!.toJson();
    }
    if (timeslot != null) {
      data['timeslot'] = timeslot!.toJson();
    }
    if (vitals != null) {
      data['vitals'] = vitals!.map((v) => v.toJson()).toList();
    }
    if (appointmentsMedicines != null) {
      data['appointments_medicines'] =
          appointmentsMedicines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
