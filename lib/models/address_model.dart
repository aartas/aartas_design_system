class Address {
  int? id;
  dynamic patientId;
  dynamic fullName;
  dynamic addressLine1;
  dynamic addressLine2;
  dynamic zipCode;
  dynamic country;
  dynamic state;
  dynamic city;

  Address(
      {this.id,
      this.patientId,
      this.fullName,
      this.addressLine1,
      this.addressLine2,
      this.zipCode,
      this.country,
      this.state,
      this.city});

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
    return data;
  }
}
