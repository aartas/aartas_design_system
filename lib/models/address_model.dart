class Address {
  int? id;
  int? patientId;
  String? fullName;
  String? addressLine1;
  String? addressLine2;
  String? zipCode;
  String? country;
  String? state;
  String? city;
  String? createdAt;
  String? updatedAt;
  int? status;

  Address(
      {this.id,
      this.patientId,
      this.fullName,
      this.addressLine1,
      this.addressLine2,
      this.zipCode,
      this.country,
      this.state,
      this.city,
      this.createdAt,
      this.updatedAt,
      this.status});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    fullName = json['full_name'];
    addressLine1 = json['address_line1'];
    addressLine2 = json['address_line2'];
    zipCode = json['zip_code'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_id'] = patientId;
    data['full_name'] = fullName;
    data['address_line1'] = addressLine1;
    data['address_line2'] = addressLine2;
    data['zip_code'] = zipCode;
    data['country'] = country;
    data['state'] = state;
    data['city'] = city;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['status'] = status;
    return data;
  }
}
