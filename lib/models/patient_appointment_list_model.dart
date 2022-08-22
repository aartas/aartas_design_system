import 'package:aartas_design_system/models/doctor_model.dart';
import 'package:aartas_design_system/models/family_members_model.dart';
import 'package:aartas_design_system/models/timeslot_model.dart';

class PatientAppointment {
  String? message;
  bool? status;
  List<PatientAppointmentData>? data;

  PatientAppointment({this.message, this.status, this.data});

  PatientAppointment.fromJson(Map<String, dynamic> json) {
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
  int? billId;
  int? doctorId;
  int? patientId;
  int? timeslotId;
  String? paymentMethod;
  String? paymentMethodDetails;
  String? payId;
  int? appointmentStatus;
  int? paymentStatus;
  String? consFee;
  String? docDiscount;
  String? discount;
  int? couponId;
  int? appointmentType;
  String? campId;
  String? campDoctorId;
  int? procedureId;
  String? procedureCost;
  int? patientBundlesId;
  String? appointmentDate;
  String? totalAmount;
  String? prescriptionFile;
  String? createdAt;
  String? updatedAt;
  int? status;
  DoctorData? doctor;
  FamilyMemberData? patient;
  Timeslot? timeslot;
  Bundles? bundles;

  PatientAppointmentData(
      {this.id,
      this.billId,
      this.doctorId,
      this.patientId,
      this.timeslotId,
      this.paymentMethod,
      this.paymentMethodDetails,
      this.payId,
      this.appointmentStatus,
      this.paymentStatus,
      this.consFee,
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
      this.totalAmount,
      this.prescriptionFile,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.doctor,
      this.patient,
      this.timeslot,
      this.bundles});

  PatientAppointmentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    billId = json['bill_id'];
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    timeslotId = json['timeslot_id'];
    paymentMethod = json['payment_method'];
    paymentMethodDetails = json['payment_method_details'];
    payId = json['pay_id'];
    appointmentStatus = json['appointment_status'];
    paymentStatus = json['payment_status'];
    consFee = json['cons_fee'];
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
    totalAmount = json['total_amount'];
    prescriptionFile = json['prescription_file'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    doctor =
        json['doctor'] != null ? DoctorData.fromJson(json['doctor']) : null;
    patient = json['patient'] != null
        ? FamilyMemberData.fromJson(json['patient'])
        : null;
    timeslot =
        json['timeslot'] != null ? Timeslot.fromJson(json['timeslot']) : null;
    bundles = json['bundle'] != null ? Bundles.fromJson(json['bundle']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bill_id'] = billId;
    data['doctor_id'] = doctorId;
    data['patient_id'] = patientId;
    data['timeslot_id'] = timeslotId;
    data['payment_method'] = paymentMethod;
    data['payment_method_details'] = paymentMethodDetails;
    data['pay_id'] = payId;
    data['appointment_status'] = appointmentStatus;
    data['payment_status'] = paymentStatus;
    data['cons_fee'] = consFee;
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
    data['prescription_file'] = prescriptionFile;
    data['total_amount'] = totalAmount;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    if (bundles != null) {
      data['bundle'] = bundles!.toJson();
    }
    return data;
  }
}

// class Speciality {
//   int? id;
//   String? name;
//   String? iconUrl;
//   int? status;
//   String? description;
//   String? conditions;
//   String? createdAt;
//   String? updatedAt;
//   String? bgColor1;
//   String? bgColor2;
//   String? iconColor;
//   String? createdBy;
//   String? updatedBy;

//   Speciality(
//       {this.id,
//       this.name,
//       this.iconUrl,
//       this.status,
//       this.description,
//       this.conditions,
//       this.createdAt,
//       this.updatedAt,
//       this.bgColor1,
//       this.bgColor2,
//       this.iconColor,
//       this.createdBy,
//       this.updatedBy});

//   Speciality.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     iconUrl = json['icon_url'];
//     status = json['status'];
//     description = json['description'];
//     conditions = json['conditions'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     bgColor1 = json['bg_color1'];
//     bgColor2 = json['bg_color2'];
//     iconColor = json['icon_color'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['icon_url'] = iconUrl;
//     data['status'] = status;
//     data['description'] = description;
//     data['conditions'] = conditions;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['bg_color1'] = bgColor1;
//     data['bg_color2'] = bgColor2;
//     data['icon_color'] = iconColor;
//     data['created_by'] = createdBy;
//     data['updated_by'] = updatedBy;
//     return data;
//   }
// }

// class Procedure {
//   int? id;
//   int? doctorId;
//   String? title;
//   String? description;
//   String? cost;
//   String? totalSessions;
//   String? sacNo;
//   int? showCost;
//   int? status;

//   Procedure(
//       {this.id,
//       this.doctorId,
//       this.title,
//       this.description,
//       this.cost,
//       this.totalSessions,
//       this.sacNo,
//       this.showCost,
//       this.status});

//   Procedure.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     doctorId = json['doctor_id'];
//     title = json['title'];
//     description = json['description'];
//     cost = json['cost'];
//     totalSessions = json['total_sessions'];
//     sacNo = json['sac_no'];
//     showCost = json['show_cost'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['doctor_id'] = doctorId;
//     data['title'] = title;
//     data['description'] = description;
//     data['cost'] = cost;
//     data['total_sessions'] = totalSessions;
//     data['sac_no'] = sacNo;
//     data['show_cost'] = showCost;
//     data['status'] = status;
//     return data;
//   }
// }

// class FamilyMemberData {
//   int? id;
//   String? fullName;
//   String? phoneNumber;
//   String? email;
//   String? gender;
//   String? pinCode;
//   String? fcmToken;
//   String? dob;
//   int? age;
//   String? relation;
//   int? linkId;
//   String? location;
//   String? latitude;
//   String? longitude;
//   String? status;

//   FamilyMemberData(
//       {this.id,
//       this.fullName,
//       this.phoneNumber,
//       this.email,
//       this.gender,
//       this.pinCode,
//       this.fcmToken,
//       this.dob,
//       this.age,
//       this.relation,
//       this.linkId,
//       this.location,
//       this.latitude,
//       this.longitude,
//       this.status});

//   FamilyMemberData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     fullName = json['full_name'];
//     phoneNumber = json['phone_number'];
//     email = json['email'];
//     gender = json['gender'];
//     pinCode = json['pin_code'];
//     fcmToken = json['fcm_token'];
//     dob = json['dob'];
//     age = json['age'];
//     relation = json['relation'];
//     linkId = json['link_id'];
//     location = json['location'];
//     latitude = json['latitude'];
//     longitude = json['longitude'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['full_name'] = fullName;
//     data['phone_number'] = phoneNumber;
//     data['email'] = email;
//     data['gender'] = gender;
//     data['pin_code'] = pinCode;
//     data['fcm_token'] = fcmToken;
//     data['dob'] = dob;
//     data['age'] = age;
//     data['relation'] = relation;
//     data['link_id'] = linkId;
//     data['location'] = location;
//     data['latitude'] = latitude;
//     data['longitude'] = longitude;
//     data['status'] = status;
//     return data;
//   }
// }

// class Timeslots {
//   int? id;
//   int? doctorId;
//   String? date;
//   String? timeFrom;
//   String? timeTo;
//   int? clinicId;
//   int? bookingStatus;
//   int? status;

//   Timeslots(
//       {this.id,
//       this.doctorId,
//       this.date,
//       this.timeFrom,
//       this.timeTo,
//       this.clinicId,
//       this.bookingStatus,
//       this.status});

//   Timeslots.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     doctorId = json['doctor_id'];
//     date = json['date'];
//     timeFrom = json['time_from'];
//     timeTo = json['time_to'];
//     clinicId = json['clinic_id'];
//     bookingStatus = json['booking_status'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['doctor_id'] = doctorId;
//     data['date'] = date;
//     data['time_from'] = timeFrom;
//     data['time_to'] = timeTo;
//     data['clinic_id'] = clinicId;
//     data['booking_status'] = bookingStatus;
//     data['status'] = status;
//     return data;
//   }
// }

class Bundles {
  int? id;
  int? patientId;
  int? bundleId;
  int? isComplete;
  int? status;
  Bundle? bundle;
  List<Appointments>? appointments;

  Bundles(
      {this.id,
      this.patientId,
      this.bundleId,
      this.isComplete,
      this.status,
      this.bundle,
      this.appointments});

  Bundles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    bundleId = json['bundle_id'];
    isComplete = json['is_complete'];
    status = json['status'];
    bundle = json['bundle'] != null ? Bundle.fromJson(json['bundle']) : null;
    if (json['appointments'] != null) {
      appointments = <Appointments>[];
      json['appointments'].forEach((v) {
        appointments!.add(Appointments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_id'] = patientId;
    data['bundle_id'] = bundleId;
    data['is_complete'] = isComplete;
    data['status'] = status;
    if (bundle != null) {
      data['bundle'] = bundle!.toJson();
    }
    if (appointments != null) {
      data['appointments'] = appointments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bundle {
  int? id;
  String? title;
  String? description;
  String? image;
  String? fees;
  String? ageFrom;
  String? ageTo;
  String? gender;
  String? diseases;
  String? symptoms;
  String? whatsIncluded;
  int? duration;
  int? durationType;
  String? createdAt;
  String? updatedAt;
  String? createdBy;
  String? updatedBy;
  int? status;
  List<Doctors>? doctors;

  Bundle(
      {this.id,
      this.title,
      this.description,
      this.image,
      this.fees,
      this.ageFrom,
      this.ageTo,
      this.gender,
      this.diseases,
      this.symptoms,
      this.whatsIncluded,
      this.duration,
      this.durationType,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.status,
      this.doctors});

  Bundle.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    fees = json['fees'];
    ageFrom = json['age_from'];
    ageTo = json['age_to'];
    gender = json['gender'];
    diseases = json['diseases'];
    symptoms = json['symptoms'];
    whatsIncluded = json['whats_included'];
    duration = json['duration'];
    durationType = json['duration_type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    status = json['status'];
    if (json['doctors'] != null) {
      doctors = <Doctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(Doctors.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['image'] = image;
    data['fees'] = fees;
    data['age_from'] = ageFrom;
    data['age_to'] = ageTo;
    data['gender'] = gender;
    data['diseases'] = diseases;
    data['symptoms'] = symptoms;
    data['whats_included'] = whatsIncluded;
    data['duration'] = duration;
    data['duration_type'] = durationType;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['status'] = status;
    if (doctors != null) {
      data['doctors'] = doctors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Doctors {
  int? id;
  int? doctorId;
  int? bundlesId;
  String? symptoms;
  DoctorData? doctor;
  int? appointmentDone;

  Doctors(
      {this.id,
      this.doctorId,
      this.bundlesId,
      this.symptoms,
      this.doctor,
      this.appointmentDone});

  Doctors.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    bundlesId = json['bundles_id'];
    symptoms = json['symptoms'];
    doctor =
        json['doctor'] != null ? DoctorData.fromJson(json['doctor']) : null;
    appointmentDone = json['appointment_done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['bundles_id'] = bundlesId;
    data['symptoms'] = symptoms;
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    data['appointment_done'] = appointmentDone;
    return data;
  }
}

class Appointments {
  int? id;
  int? doctorId;
  int? patientBundlesId;

  Appointments({this.id, this.doctorId, this.patientBundlesId});

  Appointments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    patientBundlesId = json['patient_bundles_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['patient_bundles_id'] = patientBundlesId;
    return data;
  }
}
