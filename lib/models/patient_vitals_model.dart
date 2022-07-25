class PatientVitalsResponse {
  String? message;
  bool? status;
  PatientVitals? data;

  PatientVitalsResponse({this.message, this.status, this.data});

  PatientVitalsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? PatientVitals.fromJson(json['data']) : null;
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

class PatientVitals {
  int? id;
  dynamic appointmentId;
  dynamic patientId;
  dynamic vitalsId;
  dynamic value;
  Vital? vital;

  PatientVitals(
      {this.id,
      this.appointmentId,
      this.patientId,
      this.vitalsId,
      this.value,
      this.vital});

  PatientVitals.fromJson(Map<String, dynamic> json) {
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
  dynamic title;
  dynamic unit;

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
