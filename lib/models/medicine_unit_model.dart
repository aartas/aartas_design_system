class MedicineUnitResponse {
  String? message;
  bool? status;
  MedicineUnitResponseData? data;

  MedicineUnitResponse({this.message, this.status, this.data});

  MedicineUnitResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? MedicineUnitResponseData.fromJson(json['data'])
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

class MedicineUnitResponseData {
  List<MedicineUnits>? medicineUnits;

  MedicineUnitResponseData({this.medicineUnits});

  MedicineUnitResponseData.fromJson(Map<String, dynamic> json) {
    if (json['medicine_units'] != null) {
      medicineUnits = <MedicineUnits>[];
      json['medicine_units'].forEach((v) {
        medicineUnits!.add(MedicineUnits.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (medicineUnits != null) {
      data['medicine_units'] = medicineUnits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MedicineUnits {
  int? id;
  String? title;

  MedicineUnits({this.id, this.title});

  MedicineUnits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
