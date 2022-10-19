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
  List<Vitals>? sBP;
  List<Vitals>? dBP;
  List<Vitals>? temperature;
  List<Vitals>? heartRate;
  List<Vitals>? weight;
  List<Vitals>? height;
  List<Vitals>? bMI;
  List<Vitals>? spO2;
  List<Vitals>? glucose;
  List<Vitals>? headCircumference;

  PatientVitalsTrendData(
      {this.sBP,
      this.dBP,
      this.temperature,
      this.heartRate,
      this.weight,
      this.height,
      this.bMI,
      this.spO2,
      this.glucose,
      this.headCircumference});

  PatientVitalsTrendData.fromJson(Map<String, dynamic> json) {
    if (json['SBP'] != null) {
      sBP = <Vitals>[];
      json['SBP'].forEach((v) {
        sBP!.add(Vitals.fromJson(v));
      });
    }
    if (json['DBP'] != null) {
      dBP = <Vitals>[];
      json['DBP'].forEach((v) {
        dBP!.add(Vitals.fromJson(v));
      });
    }
    if (json['Temperature'] != null) {
      temperature = <Vitals>[];
      json['Temperature'].forEach((v) {
        temperature!.add(Vitals.fromJson(v));
      });
    }
    if (json['Heart Rate'] != null) {
      heartRate = <Vitals>[];
      json['Heart Rate'].forEach((v) {
        heartRate!.add(Vitals.fromJson(v));
      });
    }
    if (json['Weight'] != null) {
      weight = <Vitals>[];
      json['Weight'].forEach((v) {
        weight!.add(Vitals.fromJson(v));
      });
    }
    if (json['Height'] != null) {
      height = <Vitals>[];
      json['Height'].forEach((v) {
        height!.add(Vitals.fromJson(v));
      });
    }
    if (json['BMI'] != null) {
      bMI = <Vitals>[];
      json['BMI'].forEach((v) {
        bMI!.add(Vitals.fromJson(v));
      });
    }
    if (json['SpO2'] != null) {
      spO2 = <Vitals>[];
      json['SpO2'].forEach((v) {
        spO2!.add(Vitals.fromJson(v));
      });
    }
    if (json['glucose '] != null) {
      glucose = <Vitals>[];
      json['glucose '].forEach((v) {
        glucose!.add(Vitals.fromJson(v));
      });
    }
    if (json['Head circumference'] != null) {
      headCircumference = <Vitals>[];
      json['Head circumference'].forEach((v) {
        headCircumference!.add(Vitals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sBP != null) {
      data['SBP'] = sBP!.map((v) => v.toJson()).toList();
    }
    if (dBP != null) {
      data['DBP'] = dBP!.map((v) => v.toJson()).toList();
    }
    if (temperature != null) {
      data['Temperature'] = temperature!.map((v) => v.toJson()).toList();
    }
    if (heartRate != null) {
      data['Heart Rate'] = heartRate!.map((v) => v.toJson()).toList();
    }
    if (weight != null) {
      data['Weight'] = weight!.map((v) => v.toJson()).toList();
    }
    if (height != null) {
      data['Height'] = height!.map((v) => v.toJson()).toList();
    }
    if (bMI != null) {
      data['BMI'] = bMI!.map((v) => v.toJson()).toList();
    }
    if (spO2 != null) {
      data['SpO2'] = spO2!.map((v) => v.toJson()).toList();
    }
    if (glucose != null) {
      data['glucose '] = glucose!.map((v) => v.toJson()).toList();
    }
    if (headCircumference != null) {
      data['Head circumference'] =
          headCircumference!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
