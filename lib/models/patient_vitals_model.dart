class PatientVitalsReponse {
  String? message;
  bool? status;
  PatientVitalsData? data;

  PatientVitalsReponse({this.message, this.status, this.data});

  PatientVitalsReponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data =
        json['data'] != null ? PatientVitalsData.fromJson(json['data']) : null;
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

class PatientVitalsData {
  List<Vitals>? vitals;

  PatientVitalsData({this.vitals});

  PatientVitalsData.fromJson(Map<String, dynamic> json) {
    if (json['vitals'] != null) {
      vitals = <Vitals>[];
      json['vitals'].forEach((v) {
        vitals!.add(Vitals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (vitals != null) {
      data['vitals'] = vitals!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Vitals {
  int? id;
  int? appointmentId;
  int? patientId;
  int? vitalsId;
  String? value;
  Vital? vital;

  Vitals(
      {this.id,
      this.appointmentId,
      this.patientId,
      this.vitalsId,
      this.value,
      this.vital});

  Vitals.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    appointmentId = json['appointment_id'];
    patientId = json['patient_id'];
    vitalsId = json['vitals_id'];
    value = json['value'];
    vital = json['vital'] != null ? Vital.fromJson(json['vital']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['appointment_id'] = appointmentId;
    data['patient_id'] = patientId;
    data['vitals_id'] = vitalsId;
    data['value'] = value;
    if (vital != null) {
      data['vital'] = vital!.toJson();
    }
    return data;
  }
}

class Vital {
  int? id;
  String? title;
  String? unit;

  Vital({this.id, this.title, this.unit});

  Vital.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    unit = json['unit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['unit'] = unit;
    return data;
  }
}
