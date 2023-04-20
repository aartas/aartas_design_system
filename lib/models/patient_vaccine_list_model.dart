class PatientVaccineList {
  String? message;
  bool? status;
  List<PatientVaccineListData>? data;

  PatientVaccineList({this.message, this.status, this.data});

  PatientVaccineList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <PatientVaccineListData>[];
      json['data'].forEach((v) {
        data!.add(PatientVaccineListData.fromJson(v));
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

class PatientVaccineListData {
  int? id;
  int? appointmentId;
  int? vaccineCategoryId;
  int? vaccineId;
  int? vaccineBrandsId;
  int? patientId;
  int? doctorId;
  int? inClinic;
  String? date;
  String? label;
  int? vaccineStatus;
  Vaccine? vaccine;
  VaccineCategory? vaccineCategory;
  VaccineBrand? vaccineBrand;

  PatientVaccineListData(
      {this.id,
      this.appointmentId,
      this.vaccineCategoryId,
      this.vaccineId,
      this.vaccineBrandsId,
      this.patientId,
      this.doctorId,
      this.inClinic,
      this.date,
      this.label,
      this.vaccineStatus,
      this.vaccine,
      this.vaccineCategory,
      this.vaccineBrand});

  PatientVaccineListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentId = json['appointment_id'];
    vaccineCategoryId = json['vaccine_category_id'];
    vaccineId = json['vaccine_id'];
    vaccineBrandsId = json['vaccine_brands_id'];
    patientId = json['patient_id'];
    doctorId = json['doctor_id'];
    inClinic = json['in_clinic'];
    date = json['date'];
    label = json['label'];
    vaccineStatus = json['vaccine_status'];
    vaccine =
        json['vaccine'] != null ? Vaccine.fromJson(json['vaccine']) : null;
    vaccineCategory = json['vaccine_category'] != null
        ? VaccineCategory.fromJson(json['vaccine_category'])
        : null;
    vaccineBrand = json['vaccine_brand'] != null
        ? VaccineBrand.fromJson(json['vaccine_brand'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['appointment_id'] = appointmentId;
    data['vaccine_category_id'] = vaccineCategoryId;
    data['vaccine_id'] = vaccineId;
    data['vaccine_brands_id'] = vaccineBrandsId;
    data['patient_id'] = patientId;
    data['doctor_id'] = doctorId;
    data['in_clinic'] = inClinic;
    data['date'] = date;
    data['label'] = label;
    data['vaccine_status'] = vaccineStatus;
    if (vaccine != null) {
      data['vaccine'] = vaccine!.toJson();
    }
    if (vaccineCategory != null) {
      data['vaccine_category'] = vaccineCategory!.toJson();
    }
    if (vaccineBrand != null) {
      data['vaccine_brand'] = vaccineBrand!.toJson();
    }
    return data;
  }
}

class Vaccine {
  int? id;
  String? name;
  int? vaccineCategoryId;

  Vaccine({this.id, this.name, this.vaccineCategoryId});

  Vaccine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    vaccineCategoryId = json['vaccine_category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['vaccine_category_id'] = vaccineCategoryId;
    return data;
  }
}

class VaccineCategory {
  int? id;
  String? title;
  int? weekFrom;
  int? weekTo;

  VaccineCategory({this.id, this.title, this.weekFrom, this.weekTo});

  VaccineCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    weekFrom = json['week_from'];
    weekTo = json['week_to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['week_from'] = weekFrom;
    data['week_to'] = weekTo;
    return data;
  }
}

class VaccineBrand {
  int? id;
  int? vaccinesId;
  String? name;
  String? manufacturer;
  String? saltName;
  String? packaging;
  String? cost;
  String? gst;
  String? mrp;

  VaccineBrand(
      {this.id,
      this.vaccinesId,
      this.name,
      this.manufacturer,
      this.saltName,
      this.packaging,
      this.cost,
      this.gst,
      this.mrp});

  VaccineBrand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vaccinesId = json['vaccines_id'];
    name = json['name'];
    manufacturer = json['manufacturer'];
    saltName = json['salt_name'];
    packaging = json['packaging'];
    cost = json['cost'];
    gst = json['gst'];
    mrp = json['mrp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vaccines_id'] = vaccinesId;
    data['name'] = name;
    data['manufacturer'] = manufacturer;
    data['salt_name'] = saltName;
    data['packaging'] = packaging;
    data['cost'] = cost;
    data['gst'] = gst;
    data['mrp'] = mrp;
    return data;
  }
}
