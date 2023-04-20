class VaccineBrandList {
  String? message;
  bool? status;
  List<VaccineBrandListData>? data;

  VaccineBrandList({this.message, this.status, this.data});

  VaccineBrandList.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <VaccineBrandListData>[];
      json['data'].forEach((v) {
        data!.add(VaccineBrandListData.fromJson(v));
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

class VaccineBrandListData {
  int? id;
  int? vaccinesId;
  String? name;
  String? manufacturer;
  String? saltName;
  String? packaging;
  String? cost;
  String? gst;
  String? mrp;
  List<VaccineBrandsCombinations>? vaccineBrandsCombinations;

  VaccineBrandListData(
      {this.id,
      this.vaccinesId,
      this.name,
      this.manufacturer,
      this.saltName,
      this.packaging,
      this.cost,
      this.gst,
      this.mrp,
      this.vaccineBrandsCombinations});

  VaccineBrandListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vaccinesId = json['vaccines_id'];
    name = json['name'];
    manufacturer = json['manufacturer'];
    saltName = json['salt_name'];
    packaging = json['packaging'];
    cost = json['cost'];
    gst = json['gst'];
    mrp = json['mrp'];
    if (json['vaccine_brands_combinations'] != null) {
      vaccineBrandsCombinations = <VaccineBrandsCombinations>[];
      json['vaccine_brands_combinations'].forEach((v) {
        vaccineBrandsCombinations!.add(VaccineBrandsCombinations.fromJson(v));
      });
    }
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
    if (vaccineBrandsCombinations != null) {
      data['vaccine_brands_combinations'] =
          vaccineBrandsCombinations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VaccineBrandsCombinations {
  int? id;
  int? vaccineCategoryId;
  int? vaccinesId;
  int? vaccinesBrandsId;
  int? status;
  Vaccine? vaccines;

  VaccineBrandsCombinations(
      {this.id,
      this.vaccineCategoryId,
      this.vaccinesId,
      this.vaccinesBrandsId,
      this.status,
      this.vaccines});

  VaccineBrandsCombinations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vaccineCategoryId = json['vaccine_category_id'];
    vaccinesId = json['vaccines_id'];
    vaccinesBrandsId = json['vaccines_brands_id'];
    status = json['status'];
    vaccines =
        json['vaccines'] != null ? Vaccine.fromJson(json['vaccines']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vaccine_category_id'] = vaccineCategoryId;
    data['vaccines_id'] = vaccinesId;
    data['vaccines_brands_id'] = vaccinesBrandsId;
    data['status'] = status;
    if (vaccines != null) {
      data['vaccines'] = vaccines!.toJson();
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
