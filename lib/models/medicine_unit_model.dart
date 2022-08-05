import 'package:aartas_design_system/models/medicine_model.dart';

class MedicineUnitResponse {
  String? message;
  bool? status = false;
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
  List<MedicineUnit>? medicineUnits;

  MedicineUnitResponseData({this.medicineUnits});

  MedicineUnitResponseData.fromJson(Map<String, dynamic> json) {
    if (json['medicine_units'] != null) {
      medicineUnits = <MedicineUnit>[];
      json['medicine_units'].forEach((v) {
        medicineUnits!.add(MedicineUnit.fromJson(v));
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
