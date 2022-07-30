class MedicineResponse {
  String? message;
  bool? status;
  MedicineResponseData? medicineResponseData;

  MedicineResponse({this.message, this.status, this.medicineResponseData});

  MedicineResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    medicineResponseData = json['data'] != null
        ? MedicineResponseData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (medicineResponseData != null) {
      data['data'] = medicineResponseData!.toJson();
    }
    return data;
  }
}

class MedicineResponseData {
  List<Medicine>? medicine;

  MedicineResponseData({this.medicine});

  MedicineResponseData.fromJson(Map<String, dynamic> json) {
    if (json['medicine'] != null) {
      medicine = <Medicine>[];
      json['medicine'].forEach((v) {
        medicine!.add(Medicine.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (medicine != null) {
      data['medicine'] = medicine!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medicine {
  int? id;
  dynamic displayName;
  dynamic name;
  dynamic saltName;
  dynamic manufacturer;
  dynamic strength;
  dynamic unitId;
  dynamic packaging;
  dynamic packagingTypeId;
  dynamic medicineFormId;
  dynamic schedule;
  dynamic image;
  dynamic hsnCode;
  dynamic rackNumber;
  dynamic maxStockCount;
  dynamic minStockCount;
  dynamic alertStockCount;

  Medicine(
      {this.id,
      this.displayName,
      this.name,
      this.saltName,
      this.manufacturer,
      this.strength,
      this.unitId,
      this.packaging,
      this.packagingTypeId,
      this.medicineFormId,
      this.schedule,
      this.image,
      this.hsnCode,
      this.rackNumber,
      this.maxStockCount,
      this.minStockCount,
      this.alertStockCount});

  Medicine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    displayName = json['display_name'];
    name = json['name'];
    saltName = json['salt_name'];
    manufacturer = json['manufacturer'];
    strength = json['strength'];
    unitId = json['unit_id'];
    packaging = json['packaging'];
    packagingTypeId = json['packaging_type_id'];
    medicineFormId = json['medicine_form_id'];
    schedule = json['schedule'];
    image = json['image'];
    hsnCode = json['hsn_code'];
    rackNumber = json['rack_number'];
    maxStockCount = json['max_stock_count'];
    minStockCount = json['min_stock_count'];
    alertStockCount = json['alert_stock_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['display_name'] = displayName;
    data['name'] = name;
    data['salt_name'] = saltName;
    data['manufacturer'] = manufacturer;
    data['strength'] = strength;
    data['unit_id'] = unitId;
    data['packaging'] = packaging;
    data['packaging_type_id'] = packagingTypeId;
    data['medicine_form_id'] = medicineFormId;
    data['schedule'] = schedule;
    data['image'] = image;
    data['hsn_code'] = hsnCode;
    data['rack_number'] = rackNumber;
    data['max_stock_count'] = maxStockCount;
    data['min_stock_count'] = minStockCount;
    data['alert_stock_count'] = alertStockCount;
    return data;
  }
}
