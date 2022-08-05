import 'package:aartas_design_system/models/speciality_model.dart';

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
  dynamic doctorName;
  dynamic email;
  dynamic phoneNumber;
  dynamic gender;
  dynamic address;
  dynamic languages;
  int? specialityId;
  dynamic registrationNum;
  dynamic degreeSuffix;
  dynamic expertiseSubSpecialty;
  dynamic image;
  dynamic scheduleDays;
  dynamic scheduleTimings;
  dynamic agreementFile;
  dynamic agreementRenewDate;
  dynamic consulationFee;
  dynamic timePerPatient;
  dynamic appointmentPhoneNumber;
  dynamic totalExperience;
  dynamic rentAmount;
  dynamic securityAmount;
  Speciality? speciality;

  DoctorData({
    this.id,
    this.doctorName,
    this.email,
    this.phoneNumber,
    this.gender,
    this.address,
    this.languages,
    this.specialityId,
    this.registrationNum,
    this.degreeSuffix,
    this.expertiseSubSpecialty,
    this.image,
    this.scheduleDays,
    this.scheduleTimings,
    this.agreementFile,
    this.agreementRenewDate,
    this.consulationFee,
    this.timePerPatient,
    this.appointmentPhoneNumber,
    this.totalExperience,
    this.rentAmount,
    this.securityAmount,
    this.speciality,
  });

  DoctorData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorName = json['doctor_name'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    gender = json['gender'];
    address = json['address'];
    languages = json['languages'];
    specialityId = json['speciality_id'];
    registrationNum = json['registration_num'];
    degreeSuffix = json['degree_suffix'];
    expertiseSubSpecialty = json['expertise_subSpecialty'];
    image = json['image'];
    scheduleDays = json['scheduleDays'];
    scheduleTimings = json['scheduleTimings'];
    agreementFile = json['agreement_file'];
    agreementRenewDate = json['agreement_renew_date'];
    consulationFee = json['consulationFee'];
    timePerPatient = json['time_per_patient'];
    appointmentPhoneNumber = json['appointment_phone_number'];
    totalExperience = json['total_experience'];
    rentAmount = json['rent_amount'];
    securityAmount = json['security_amount'];
    speciality = json['speciality'] != null
        ? Speciality.fromJson(json['speciality'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_name'] = doctorName;
    data['email'] = email;
    data['phone_number'] = phoneNumber;
    data['gender'] = gender;
    data['address'] = address;
    data['languages'] = languages;
    data['speciality_id'] = specialityId;
    data['registration_num'] = registrationNum;
    data['degree_suffix'] = degreeSuffix;
    data['expertise_subSpecialty'] = expertiseSubSpecialty;
    data['image'] = image;
    data['scheduleDays'] = scheduleDays;
    data['scheduleTimings'] = scheduleTimings;
    data['agreement_file'] = agreementFile;
    data['agreement_renew_date'] = agreementRenewDate;
    data['consulationFee'] = consulationFee;
    data['time_per_patient'] = timePerPatient;
    data['appointment_phone_number'] = appointmentPhoneNumber;
    data['total_experience'] = totalExperience;
    data['rent_amount'] = rentAmount;
    data['security_amount'] = securityAmount;
    if (speciality != null) {
      data['speciality'] = speciality!.toJson();
    }
    return data;
  }
}
