import 'package:aartas_design_system/models/doctor_model.dart';

class HealthProgramResponse {
  String? message;
  bool? status;
  HealthProgramData? data;

  HealthProgramResponse({this.message, this.status, this.data});

  HealthProgramResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data =
        json['data'] != null ? HealthProgramData.fromJson(json['data']) : null;
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

class HealthProgramData {
  List<BundleList>? bundleList;

  HealthProgramData({this.bundleList});

  HealthProgramData.fromJson(Map<String, dynamic> json) {
    if (json['bundle_list'] != null) {
      bundleList = <BundleList>[];
      json['bundle_list'].forEach((v) {
        bundleList!.add(BundleList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (bundleList != null) {
      data['bundle_list'] = bundleList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BundleList {
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
  int? status;
  List<BundleDoctors>? doctors;

  BundleList(
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
      this.status,
      this.doctors});

  BundleList.fromJson(Map<String, dynamic> json) {
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
    status = json['status'];
    if (json['doctors'] != null) {
      doctors = <BundleDoctors>[];
      json['doctors'].forEach((v) {
        doctors!.add(BundleDoctors.fromJson(v));
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
    data['status'] = status;
    if (doctors != null) {
      data['doctors'] = doctors!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BundleDoctors {
  int? doctorId;
  int? bundlesId;
  String? symptoms;
  DoctorData? doctor;

  BundleDoctors({this.doctorId, this.bundlesId, this.doctor});

  BundleDoctors.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    bundlesId = json['bundles_id'];
    symptoms = json['symptoms'];
    doctor =
        json['doctor'] != null ? DoctorData.fromJson(json['doctor']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_id'] = doctorId;
    data['bundles_id'] = bundlesId;
    data['symptoms'] = symptoms;
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    return data;
  }
}
