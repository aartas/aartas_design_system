import 'package:aartas_design_system/models/appointment_model.dart';
import 'package:aartas_design_system/models/medicine_model.dart';
import 'package:aartas_design_system/models/patient_appointment_list_model.dart';

class PatientCartResponse {
  String? message;
  bool? status;
  PatientCartData? data;

  PatientCartResponse({this.message, this.status, this.data});

  PatientCartResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? PatientCartData.fromJson(json['data']) : null;
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

class PatientCartData {
  int? id;
  int? patientId;
  String? cartTotal;
  int? status;
  List<AppointmentData>? appointment;
  List<Medicines>? medicines;
  List<Vaccines>? vaccines;

  PatientCartData(
      {this.id,
      this.patientId,
      this.cartTotal,
      this.status,
      this.appointment,
      this.medicines,
      this.vaccines});

  PatientCartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientId = json['patient_id'];
    cartTotal = json['cart_total'];
    status = json['status'];
    if (json['appointment'] != null) {
      appointment = <AppointmentData>[];
      json['appointment'].forEach((v) {
        appointment!.add(AppointmentData.fromJson(v));
      });
    }
    if (json['medicines'] != null) {
      medicines = <Medicines>[];
      json['medicines'].forEach((v) {
        medicines!.add(Medicines.fromJson(v));
      });
    }
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
    data['patient_id'] = patientId;
    data['cart_total'] = cartTotal;
    data['status'] = status;
    if (appointment != null) {
      data['appointment'] = appointment!.map((v) => v.toJson()).toList();
    }
    if (medicines != null) {
      data['medicines'] = medicines!.map((v) => v.toJson()).toList();
    }
    if (vaccines != null) {
      data['vaccines'] = vaccines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Medicines {
  int? id;
  int? patientCartId;
  int? appointmentId;
  int? mediciesStocksId;
  int? medicineId;
  int? qty;
  dynamic discount;
  dynamic discMrp;
  dynamic mainMrp;
  String? sGST;
  String? sGSTRate;
  String? cGST;
  String? cGSTRate;
  String? iGST;
  String? iGSTRate;
  dynamic totalAmount;
  int? buyStatus;
  int? isStockAvailable;
  int? status;
  Medicine? medicine;
  MedicineStocks? medicineStocks;

  Medicines(
      {this.id,
      this.patientCartId,
      this.appointmentId,
      this.mediciesStocksId,
      this.medicineId,
      this.qty,
      this.discount,
      this.discMrp,
      this.mainMrp,
      this.sGST,
      this.sGSTRate,
      this.cGST,
      this.cGSTRate,
      this.iGST,
      this.iGSTRate,
      this.totalAmount,
      this.buyStatus,
      this.isStockAvailable,
      this.status,
      this.medicine,
      this.medicineStocks});

  Medicines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientCartId = json['patient_cart_id'];
    appointmentId = json['appointment_id'];
    mediciesStocksId = json['medicies_stocks_id'];
    medicineId = json['medicine_id'];
    qty = json['qty'];
    discount = json['discount'];
    discMrp = json['disc_mrp'];
    mainMrp = json['main_mrp'];
    sGST = json['SGST'];
    sGSTRate = json['SGST_rate'];
    cGST = json['CGST'];
    cGSTRate = json['CGST_rate'];
    iGST = json['IGST'];
    iGSTRate = json['IGST_rate'];
    totalAmount = json['total_amount'];
    buyStatus = json['buy_status'];
    isStockAvailable = json['is_stock_available'];
    status = json['status'];
    medicine =
        json['medicine'] != null ? Medicine.fromJson(json['medicine']) : null;
    medicineStocks = json['medicine_stocks'] != null
        ? MedicineStocks.fromJson(json['medicine_stocks'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_cart_id'] = patientCartId;
    data['appointment_id'] = appointmentId;
    data['medicies_stocks_id'] = mediciesStocksId;
    data['medicine_id'] = medicineId;
    data['qty'] = qty;
    data['discount'] = discount;
    data['disc_mrp'] = discMrp;
    data['main_mrp'] = mainMrp;
    data['SGST'] = sGST;
    data['SGST_rate'] = sGSTRate;
    data['CGST'] = cGST;
    data['CGST_rate'] = cGSTRate;
    data['IGST'] = iGST;
    data['IGST_rate'] = iGSTRate;
    data['total_amount'] = totalAmount;
    data['buy_status'] = buyStatus;
    data['is_stock_available'] = isStockAvailable;
    data['status'] = status;
    if (medicine != null) {
      data['medicine'] = medicine!.toJson();
    }
    if (medicineStocks != null) {
      data['medicine_stocks'] = medicineStocks!.toJson();
    }
    return data;
  }
}

class MedicineStocks {
  int? id;
  int? medicineId;
  int? purchaseEntryId;
  int? qty;
  String? rate;
  String? expiryDate;
  String? batchNo;
  String? mfdDate;
  String? mrp;
  String? cost;
  String? sGST;
  String? sGSTRate;
  String? cGST;
  String? cGSTRate;
  String? iGST;
  String? iGSTRate;
  String? discount;
  int? locationId;
  int? channel;
  String? tradeDiscount;
  int? currentStock;
  String? totalAmount;

  int? status;

  MedicineStocks(
      {this.id,
      this.medicineId,
      this.purchaseEntryId,
      this.qty,
      this.rate,
      this.expiryDate,
      this.batchNo,
      this.mfdDate,
      this.mrp,
      this.cost,
      this.sGST,
      this.sGSTRate,
      this.cGST,
      this.cGSTRate,
      this.iGST,
      this.iGSTRate,
      this.discount,
      this.locationId,
      this.channel,
      this.tradeDiscount,
      this.currentStock,
      this.totalAmount,
      this.status});

  MedicineStocks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicineId = json['medicine_id'];
    purchaseEntryId = json['purchase_entry_id'];
    qty = json['qty'];
    rate = json['rate'];
    expiryDate = json['expiry_date'];
    batchNo = json['batch_no'];
    mfdDate = json['mfd_date'];
    mrp = json['mrp'];
    cost = json['cost'];
    sGST = json['SGST'];
    sGSTRate = json['SGST_rate'];
    cGST = json['CGST'];
    cGSTRate = json['CGST_rate'];
    iGST = json['IGST'];
    iGSTRate = json['IGST_rate'];
    discount = json['discount'];
    locationId = json['location_id'];
    channel = json['channel'];
    tradeDiscount = json['trade_discount'];
    currentStock = json['current_stock'];
    totalAmount = json['total_amount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['medicine_id'] = medicineId;
    data['purchase_entry_id'] = purchaseEntryId;
    data['qty'] = qty;
    data['rate'] = rate;
    data['expiry_date'] = expiryDate;
    data['batch_no'] = batchNo;
    data['mfd_date'] = mfdDate;
    data['mrp'] = mrp;
    data['cost'] = cost;
    data['SGST'] = sGST;
    data['SGST_rate'] = sGSTRate;
    data['CGST'] = cGST;
    data['CGST_rate'] = cGSTRate;
    data['IGST'] = iGST;
    data['IGST_rate'] = iGSTRate;
    data['discount'] = discount;
    data['location_id'] = locationId;
    data['channel'] = channel;
    data['trade_discount'] = tradeDiscount;
    data['current_stock'] = currentStock;
    data['total_amount'] = totalAmount;
    data['status'] = status;
    return data;
  }
}

class Vaccines {
  int? id;
  int? patientCartId;
  int? appointmentId;
  int? vaccineStocksId;
  int? vaccineBrandId;
  int? qty;
  int? discount;
  int? discMrp;
  int? mainMrp;
  String? sGST;
  String? sGSTRate;
  String? cGST;
  String? cGSTRate;
  String? iGST;
  String? iGSTRate;
  int? totalAmount;

  int? status;
  Vaccine? vaccine;
  VaccineStocks? vaccineStocks;

  Vaccines(
      {this.id,
      this.patientCartId,
      this.appointmentId,
      this.vaccineStocksId,
      this.vaccineBrandId,
      this.qty,
      this.discount,
      this.discMrp,
      this.mainMrp,
      this.sGST,
      this.sGSTRate,
      this.cGST,
      this.cGSTRate,
      this.iGST,
      this.iGSTRate,
      this.totalAmount,
      this.status,
      this.vaccine,
      this.vaccineStocks});

  Vaccines.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientCartId = json['patient_cart_id'];
    appointmentId = json['appointment_id'];
    vaccineStocksId = json['vaccine_stocks_id'];
    vaccineBrandId = json['vaccine_brand_id'];
    qty = json['qty'];
    discount = json['discount'];
    discMrp = json['disc_mrp'];
    mainMrp = json['main_mrp'];
    sGST = json['SGST'];
    sGSTRate = json['SGST_rate'];
    cGST = json['CGST'];
    cGSTRate = json['CGST_rate'];
    iGST = json['IGST'];
    iGSTRate = json['IGST_rate'];
    totalAmount = json['total_amount'];
    status = json['status'];
    vaccine =
        json['vaccine'] != null ? Vaccine.fromJson(json['vaccine']) : null;
    vaccineStocks = json['vaccine_stocks'] != null
        ? VaccineStocks.fromJson(json['vaccine_stocks'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patient_cart_id'] = patientCartId;
    data['appointment_id'] = appointmentId;
    data['vaccine_stocks_id'] = vaccineStocksId;
    data['vaccine_brand_id'] = vaccineBrandId;
    data['qty'] = qty;
    data['discount'] = discount;
    data['disc_mrp'] = discMrp;
    data['main_mrp'] = mainMrp;
    data['SGST'] = sGST;
    data['SGST_rate'] = sGSTRate;
    data['CGST'] = cGST;
    data['CGST_rate'] = cGSTRate;
    data['IGST'] = iGST;
    data['IGST_rate'] = iGSTRate;
    data['total_amount'] = totalAmount;
    data['status'] = status;
    if (vaccine != null) {
      data['vaccine'] = vaccine!.toJson();
    }
    if (vaccineStocks != null) {
      data['vaccine_stocks'] = vaccineStocks!.toJson();
    }
    return data;
  }
}

class Vaccine {
  int? id;
  int? vaccinesId;
  String? name;
  dynamic hsnCode;
  String? manufacturer;
  dynamic saltName;
  dynamic packaging;
  dynamic cost;
  dynamic gst;
  dynamic mrp;
  int? maxStockCount;
  int? minStockCount;
  int? alertStockCount;
  dynamic createdAt;
  dynamic updatedAt;
  dynamic createdBy;
  dynamic updatedBy;
  int? status;

  Vaccine(
      {this.id,
      this.vaccinesId,
      this.name,
      this.hsnCode,
      this.manufacturer,
      this.saltName,
      this.packaging,
      this.cost,
      this.gst,
      this.mrp,
      this.maxStockCount,
      this.minStockCount,
      this.alertStockCount,
      this.status});

  Vaccine.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vaccinesId = json['vaccines_id'];
    name = json['name'];
    hsnCode = json['hsn_code'];
    manufacturer = json['manufacturer'];
    saltName = json['salt_name'];
    packaging = json['packaging'];
    cost = json['cost'];
    gst = json['gst'];
    mrp = json['mrp'];
    maxStockCount = json['max_stock_count'];
    minStockCount = json['min_stock_count'];
    alertStockCount = json['alert_stock_count'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vaccines_id'] = vaccinesId;
    data['name'] = name;
    data['hsn_code'] = hsnCode;
    data['manufacturer'] = manufacturer;
    data['salt_name'] = saltName;
    data['packaging'] = packaging;
    data['cost'] = cost;
    data['gst'] = gst;
    data['mrp'] = mrp;
    data['max_stock_count'] = maxStockCount;
    data['min_stock_count'] = minStockCount;
    data['alert_stock_count'] = alertStockCount;
    data['status'] = status;
    return data;
  }
}

class VaccineStocks {
  int? id;
  int? vaccineBrandId;
  int? purchaseEntryId;
  String? qty;
  String? rate;
  String? expiryDate;
  String? batchNo;
  String? mfdDate;
  String? mrp;
  String? cost;
  String? sGST;
  String? sGSTRate;
  String? cGST;
  String? cGSTRate;
  String? iGST;
  String? iGSTRate;
  String? discount;
  int? locationId;
  int? channel;
  dynamic barcodeNo;
  String? tradeDiscount;
  int? currentStock;
  String? totalAmount;

  int? status;

  VaccineStocks(
      {this.id,
      this.vaccineBrandId,
      this.purchaseEntryId,
      this.qty,
      this.rate,
      this.expiryDate,
      this.batchNo,
      this.mfdDate,
      this.mrp,
      this.cost,
      this.sGST,
      this.sGSTRate,
      this.cGST,
      this.cGSTRate,
      this.iGST,
      this.iGSTRate,
      this.discount,
      this.locationId,
      this.channel,
      this.barcodeNo,
      this.tradeDiscount,
      this.currentStock,
      this.totalAmount,
      this.status});

  VaccineStocks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vaccineBrandId = json['vaccine_brand_id'];
    purchaseEntryId = json['purchase_entry_id'];
    qty = json['qty'];
    rate = json['rate'];
    expiryDate = json['expiry_date'];
    batchNo = json['batch_no'];
    mfdDate = json['mfd_date'];
    mrp = json['mrp'];
    cost = json['cost'];
    sGST = json['SGST'];
    sGSTRate = json['SGST_rate'];
    cGST = json['CGST'];
    cGSTRate = json['CGST_rate'];
    iGST = json['IGST'];
    iGSTRate = json['IGST_rate'];
    discount = json['discount'];
    locationId = json['location_id'];
    channel = json['channel'];
    barcodeNo = json['barcode_no'];
    tradeDiscount = json['trade_discount'];
    currentStock = json['current_stock'];
    totalAmount = json['total_amount'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['vaccine_brand_id'] = vaccineBrandId;
    data['purchase_entry_id'] = purchaseEntryId;
    data['qty'] = qty;
    data['rate'] = rate;
    data['expiry_date'] = expiryDate;
    data['batch_no'] = batchNo;
    data['mfd_date'] = mfdDate;
    data['mrp'] = mrp;
    data['cost'] = cost;
    data['SGST'] = sGST;
    data['SGST_rate'] = sGSTRate;
    data['CGST'] = cGST;
    data['CGST_rate'] = cGSTRate;
    data['IGST'] = iGST;
    data['IGST_rate'] = iGSTRate;
    data['discount'] = discount;
    data['location_id'] = locationId;
    data['channel'] = channel;
    data['barcode_no'] = barcodeNo;
    data['trade_discount'] = tradeDiscount;
    data['current_stock'] = currentStock;
    data['total_amount'] = totalAmount;
    data['status'] = status;
    return data;
  }
}
