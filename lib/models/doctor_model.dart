import 'package:aartas_design_system/models/procedure_model.dart';
import 'package:aartas_design_system/models/speciality_model.dart';
import 'package:aartas_design_system/models/timeslot_model.dart';

class DoctorResponse {
  String? message;
  bool? status = false;
  List<DoctorData>? data = [];

  DoctorResponse({this.message, this.status, this.data});

  DoctorResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <DoctorData>[];
      json['data'].forEach((v) {
        data!.add(DoctorData.fromJson(v));
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

class DoctorData {
  int? id;
  String? clinicId;
  String? roomId;
  String? doctorName;
  String? email;
  String? fcmToken;
  String? gender;
  String? address;
  String? cityId;
  String? languages;
  int? specialityId;
  String? registrationNum;
  String? medicalAuthorityId;
  String? degreeSuffix;
  String? expertiseSubSpecialty;
  String? image;
  String? scheduleDays;
  String? scheduleTimings;
  String? hoursPerMonth;
  String? agreementFile;
  String? agreementRenewDate;
  String? consulationFee;
  String? timePerPatient;
  String? appointmentPhoneNumber;
  String? website;
  String? instagram;
  String? facebook;
  String? profileShareCount;
  String? startDate;
  int? profileVerified;
  int? profileStatus;
  String? resetToken;
  int? onRequest;
  int? prePayEnrolled;
  String? prePayDiscount;
  String? totalExperience;
  int? status;
  String? rentAmount;
  String? securityAmount;
  String? imageUrl;
  List<Timeslot>? timeslots;
  List<Procedure>? procedure;
  Speciality? speciality;
  Timeslot? latestTimeSlot;
  List<Timings>? timings;
  List<DoctorImages>? doctorImages;
  DoctorData({
    this.id,
    this.clinicId,
    this.roomId,
    this.doctorName,
    this.email,
    this.fcmToken,
    this.gender,
    this.address,
    this.cityId,
    this.languages,
    this.specialityId,
    this.registrationNum,
    this.medicalAuthorityId,
    this.degreeSuffix,
    this.expertiseSubSpecialty,
    this.image,
    this.scheduleDays,
    this.scheduleTimings,
    this.hoursPerMonth,
    this.agreementFile,
    this.agreementRenewDate,
    this.consulationFee,
    this.timePerPatient,
    this.appointmentPhoneNumber,
    this.website,
    this.instagram,
    this.facebook,
    this.profileShareCount,
    this.startDate,
    this.profileVerified,
    this.profileStatus,
    this.resetToken,
    this.onRequest,
    this.prePayEnrolled,
    this.prePayDiscount,
    this.totalExperience,
    this.status,
    this.rentAmount,
    this.securityAmount,
    this.imageUrl,
    this.timeslots,
    this.procedure,
    this.speciality,
    this.latestTimeSlot,
    this.timings,
    this.doctorImages,
  });

  DoctorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicId = json['clinic_id'];
    roomId = json['room_id'];
    doctorName = json['doctor_name'];
    email = json['email'];
    fcmToken = json['fcm_token'];
    gender = json['gender'];
    address = json['address'];
    cityId = json['city_id'];
    languages = json['languages'];
    specialityId = json['speciality_id'];
    registrationNum = json['registration_num'];
    medicalAuthorityId = json['medical_authority_id'];
    degreeSuffix = json['degree_suffix'];
    expertiseSubSpecialty = json['expertise_subSpecialty'];
    image = json['image'];
    scheduleDays = json['scheduleDays'];
    scheduleTimings = json['scheduleTimings'];
    hoursPerMonth = json['hours_per_month'];
    agreementFile = json['agreement_file'];
    agreementRenewDate = json['agreement_renew_date'];
    consulationFee = json['consulationFee'];
    timePerPatient = json['time_per_patient'];
    appointmentPhoneNumber = json['appointment_phone_number'];
    website = json['website'];
    instagram = json['instagram'];
    facebook = json['facebook'];
    profileShareCount = json['profile_share_count'];
    profileVerified = json['profile_verified'];
    profileStatus = json['profile_status'];
    startDate = json['start_date'];
    resetToken = json['reset_token'];
    onRequest = json['on_request'];
    prePayEnrolled = json['pre_pay_enrolled'];
    prePayDiscount = json['pre_pay_discount'];
    totalExperience = json['total_experience'];
    status = json['status'];
    rentAmount = json['rent_amount'];
    securityAmount = json['security_amount'];
    imageUrl = json['image_url'];
    if (json['timeslots'] != null) {
      timeslots = <Timeslot>[];
      json['timeslots'].forEach((v) {
        timeslots!.add(Timeslot.fromJson(v));
      });
    }
    if (json['procedure'] != null) {
      procedure = <Procedure>[];
      json['procedure'].forEach((v) {
        procedure!.add(Procedure.fromJson(v));
      });
    }
    speciality = json['speciality'] != null
        ? Speciality.fromJson(json['speciality'])
        : null;
    latestTimeSlot = json['latest_timeslot'] != null
        ? Timeslot.fromJson(json['latest_timeslot'])
        : null;
    if (json['timings'] != null) {
      timings = <Timings>[];
      json['timings'].forEach((v) {
        timings!.add(Timings.fromJson(v));
      });
    }
    if (json['doctor_images'] != null) {
      doctorImages = <DoctorImages>[];
      json['doctor_images'].forEach((v) {
        doctorImages!.add(DoctorImages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['clinic_id'] = clinicId;
    data['room_id'] = roomId;
    data['doctor_name'] = doctorName;
    data['email'] = email;
    data['fcm_token'] = fcmToken;
    data['gender'] = gender;
    data['address'] = address;
    data['city_id'] = cityId;
    data['languages'] = languages;
    data['speciality_id'] = specialityId;
    data['registration_num'] = registrationNum;
    data['medical_authority_id'] = medicalAuthorityId;
    data['degree_suffix'] = degreeSuffix;
    data['expertise_subSpecialty'] = expertiseSubSpecialty;
    data['image'] = image;
    data['scheduleDays'] = scheduleDays;
    data['scheduleTimings'] = scheduleTimings;
    data['hours_per_month'] = hoursPerMonth;
    data['agreement_file'] = agreementFile;
    data['agreement_renew_date'] = agreementRenewDate;
    data['consulationFee'] = consulationFee;
    data['time_per_patient'] = timePerPatient;
    data['appointment_phone_number'] = appointmentPhoneNumber;
    data['website'] = website;
    data['instagram'] = instagram;
    data['facebook'] = facebook;
    data['start_date'] = startDate;
    data['profile_share_count'] = profileShareCount;
    data['profile_verified'] = profileVerified;
    data['profile_status'] = profileStatus;
    data['reset_token'] = resetToken;
    data['on_request'] = onRequest;
    data['pre_pay_enrolled'] = prePayEnrolled;
    data['pre_pay_discount'] = prePayDiscount;
    data['total_experience'] = totalExperience;
    data['status'] = status;
    data['rent_amount'] = rentAmount;
    data['security_amount'] = securityAmount;
    data['image_url'] = imageUrl;
    if (timeslots != null) {
      data['timeslots'] = timeslots!.map((v) => v.toJson()).toList();
    }
    if (procedure != null) {
      data['procedure'] = procedure!.map((v) => v.toJson()).toList();
    }
    if (speciality != null) {
      data['speciality'] = speciality!.toJson();
    }
    if (timings != null) {
      data['timings'] = timings!.map((v) => v.toJson()).toList();
    }
    if (doctorImages != null) {
      data['doctor_images'] = doctorImages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Timings {
  int? id;
  int? doctorId;
  String? scheduleDays;
  String? scheduleTimings;
  dynamic timePerPatient;
  int? clinicId;
  int? clinicRoomsId;
  int? createdBy;
  int? updatedBy;
  String? createdAt;
  String? updatedAt;
  int? status;
  Clinic? clinic;

  Timings(
      {this.id,
      this.doctorId,
      this.scheduleDays,
      this.scheduleTimings,
      this.timePerPatient,
      this.clinicId,
      this.clinicRoomsId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.status,
      this.clinic});

  Timings.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    scheduleDays = json['scheduleDays'];
    scheduleTimings = json['scheduleTimings'];
    timePerPatient = json['time_per_patient'];
    clinicId = json['clinic_id'];
    clinicRoomsId = json['clinic_rooms_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
    clinic = json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null;
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
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
    }
    return data;
  }
}

class Clinic {
  int? id;
  String? title;
  String? address;
  int? totalRoooms;
  String? phoneNumber;
  dynamic gSTIN;
  dynamic stateCode;
  String? ipAddressList;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic createdBy;
  dynamic updatedBy;
  int? status;

  Clinic(
      {this.id,
      this.title,
      this.address,
      this.totalRoooms,
      this.phoneNumber,
      this.gSTIN,
      this.stateCode,
      this.ipAddressList,
      this.createdAt,
      this.updatedAt,
      this.createdBy,
      this.updatedBy,
      this.status});

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    address = json['address'];
    totalRoooms = json['total_roooms'];
    phoneNumber = json['phone_number'];
    gSTIN = json['GSTIN'];
    stateCode = json['state_code'];
    ipAddressList = json['ip_address_list'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    status = json['status'];
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
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['status'] = status;
    return data;
  }
}

class DoctorImages {
  int? id;
  int? doctorId;
  int? sectionId;
  String? image;
  String? pattern;
  int? status;
  Section? section;

  DoctorImages(
      {this.id,
      this.doctorId,
      this.sectionId,
      this.image,
      this.pattern,
      this.status,
      this.section});

  DoctorImages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    sectionId = json['section_id'];
    image = json['image'];
    pattern = json['pattern'];
    status = json['status'];
    section =
        json['section'] != null ? Section.fromJson(json['section']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['section_id'] = sectionId;
    data['image'] = image;
    data['pattern'] = pattern;
    data['status'] = status;
    if (section != null) {
      data['section'] = section!.toJson();
    }
    return data;
  }
}

class Section {
  int? id;
  String? title;
  int? status;

  Section({this.id, this.title, this.status});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['status'] = status;
    return data;
  }
}
