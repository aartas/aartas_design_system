class VaccinesDetails {
  String? message;
  bool? status;
  List<VaccineData>? data;

  VaccinesDetails({this.message, this.status, this.data});

  VaccinesDetails.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <VaccineData>[];
      json['data'].forEach((v) {
        data!.add(VaccineData.fromJson(v));
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

class VaccineData {
  int? id;
  String? title;
  List<Vaccines>? vaccines;

  VaccineData({this.id, this.title, this.vaccines});

  VaccineData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    if (json['vaccines'] != null) {
      vaccines = <Vaccines>[];
      json['vaccines'].forEach((v) {
        vaccines!.add(Vaccines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (vaccines != null) {
      data['vaccines'] = vaccines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vaccines {
  int? id;
  String? name;
  int? vaccineCategoryId;
  List<VaccineBrands>? vaccineBrands;

  Vaccines({this.id, this.name, this.vaccineCategoryId, this.vaccineBrands});

  Vaccines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    vaccineCategoryId = json['vaccine_category_id'];
    if (json['vaccine_brands'] != null) {
      vaccineBrands = <VaccineBrands>[];
      json['vaccine_brands'].forEach((v) {
        vaccineBrands!.add(VaccineBrands.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['vaccine_category_id'] = vaccineCategoryId;
    if (vaccineBrands != null) {
      data['vaccine_brands'] = vaccineBrands!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VaccineBrands {
  int? id;
  int? vaccinesId;
  String? name;
  String? manufacturer;
  String? saltName;
  String? packaging;
  String? cost;
  String? gst;
  String? mrp;

  VaccineBrands(
      {this.id,
      this.vaccinesId,
      this.name,
      this.manufacturer,
      this.saltName,
      this.packaging,
      this.cost,
      this.gst,
      this.mrp});

  VaccineBrands.fromJson(Map<String, dynamic> json) {
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
