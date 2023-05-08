import 'package:aartas_design_system/models/appointment_model.dart';

class PatientVitalsTrendResponse {
  String? message;
  bool? status;
  PatientVitalsTrendData? data;

  PatientVitalsTrendResponse({this.message, this.status, this.data});

  PatientVitalsTrendResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? PatientVitalsTrendData.fromJson(json['data'])
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

class PatientVitalsTrendData {
  VitalsTrends? systolicBP;
  VitalsTrends? diastolicBP;
  VitalsTrends? temperature;
  VitalsTrends? heartRate;
  VitalsTrends? weight;
  VitalsTrends? height;
  VitalsTrends? bMI;
  VitalsTrends? spO2;
  VitalsTrends? glucose;
  VitalsTrends? headCircumference;

  PatientVitalsTrendData(
      {this.systolicBP,
      this.diastolicBP,
      this.temperature,
      this.heartRate,
      this.weight,
      this.height,
      this.bMI,
      this.spO2,
      this.glucose,
      this.headCircumference});

  PatientVitalsTrendData.fromJson(Map<String, dynamic> json) {
    systolicBP = json['Systolic BP'] != null
        ? VitalsTrends.fromJson(json['Systolic BP'])
        : null;
    diastolicBP = json['Diastolic BP'] != null
        ? VitalsTrends.fromJson(json['Diastolic BP'])
        : null;
    temperature = json['Temperature'] != null
        ? VitalsTrends.fromJson(json['Temperature'])
        : null;
    heartRate = json['Heart Rate'] != null
        ? VitalsTrends.fromJson(json['Heart Rate'])
        : null;
    weight =
        json['Weight'] != null ? VitalsTrends.fromJson(json['Weight']) : null;
    height =
        json['Height'] != null ? VitalsTrends.fromJson(json['Height']) : null;
    bMI = json['BMI'] != null ? VitalsTrends.fromJson(json['BMI']) : null;
    spO2 = json['SpO2'] != null ? VitalsTrends.fromJson(json['SpO2']) : null;
    glucose =
        json['Glucose'] != null ? VitalsTrends.fromJson(json['Glucose']) : null;
    headCircumference = json['Head Circumference'] != null
        ? VitalsTrends.fromJson(json['Head Circumference'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (systolicBP != null) {
      data['Systolic BP'] = systolicBP!.toJson();
    }
    if (diastolicBP != null) {
      data['Diastolic BP'] = diastolicBP!.toJson();
    }
    if (temperature != null) {
      data['Temperature'] = temperature!.toJson();
    }
    if (heartRate != null) {
      data['Heart Rate'] = heartRate!.toJson();
    }
    if (weight != null) {
      data['Weight'] = weight!.toJson();
    }
    if (height != null) {
      data['Height'] = height!.toJson();
    }
    if (bMI != null) {
      data['BMI'] = bMI!.toJson();
    }
    if (spO2 != null) {
      data['SpO2'] = spO2!.toJson();
    }
    if (glucose != null) {
      data['Glucose'] = glucose!.toJson();
    }
    if (headCircumference != null) {
      data['Head Circumference'] = headCircumference!.toJson();
    }
    return data;
  }
}

class VitalsTrends {
  List<Vitals>? trends;
  Vital? details;

  VitalsTrends({this.trends, this.details});

  VitalsTrends.fromJson(Map<String, dynamic> json) {
    if (json['trends'] != null) {
      trends = <Vitals>[];
      json['trends'].forEach((v) {
        trends!.add(Vitals.fromJson(v));
      });
    }
    details = json['details'] != null ? Vital.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (trends != null) {
      data['trends'] = trends!.map((v) => v.toJson()).toList();
    }
    if (details != null) {
      data['details'] = details!.toJson();
    }
    return data;
  }
}
