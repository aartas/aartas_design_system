class SaleEntry {
  int? id;
  int? billId;
  int? clinicId;
  int? doctorId;
  String? doctorName;
  int? patientId;
  int? appointmentId;
  int? grandTotal;
  String? payId;
  String? paymentMethod;
  String? paymentMethodDetails;
  int? whatsappSent;
  String? billFile;
  String? billDate;
  String? location;
  int? deliver;
  int? isDelivered;
  int? shippingAddressId;
  int? billingAddressId;
  int? fromApp;

  SaleEntry(
      {this.id,
      this.billId,
      this.clinicId,
      this.doctorId,
      this.doctorName,
      this.patientId,
      this.appointmentId,
      this.grandTotal,
      this.payId,
      this.paymentMethod,
      this.paymentMethodDetails,
      this.whatsappSent,
      this.billFile,
      this.billDate,
      this.location,
      this.deliver,
      this.isDelivered,
      this.shippingAddressId,
      this.billingAddressId,
      this.fromApp});

  SaleEntry.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    billId = json['bill_id'];
    clinicId = json['clinic_id'];
    doctorId = json['doctor_id'];
    doctorName = json['doctor_name'];
    patientId = json['patient_id'];
    appointmentId = json['appointment_id'];
    grandTotal = json['grand_total'];
    payId = json['pay_id'];
    paymentMethod = json['payment_method'];
    paymentMethodDetails = json['payment_method_details'];
    whatsappSent = json['whatsapp_sent'];
    billFile = json['bill_file'];
    billDate = json['bill_date'];
    location = json['location'];
    deliver = json['deliver'];
    isDelivered = json['is_delivered'];
    shippingAddressId = json['shipping_address_id'];
    billingAddressId = json['billing_address_id'];
    fromApp = json['from_app'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bill_id'] = billId;
    data['clinic_id'] = clinicId;
    data['doctor_id'] = doctorId;
    data['doctor_name'] = doctorName;
    data['patient_id'] = patientId;
    data['appointment_id'] = appointmentId;
    data['grand_total'] = grandTotal;
    data['pay_id'] = payId;
    data['payment_method'] = paymentMethod;
    data['payment_method_details'] = paymentMethodDetails;
    data['whatsapp_sent'] = whatsappSent;
    data['bill_file'] = billFile;
    data['bill_date'] = billDate;
    data['location'] = location;
    data['deliver'] = deliver;
    data['is_delivered'] = isDelivered;
    data['shipping_address_id'] = shippingAddressId;
    data['billing_address_id'] = billingAddressId;
    data['from_app'] = fromApp;
    return data;
  }
}
