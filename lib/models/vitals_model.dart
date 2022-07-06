class Vitals {
  int? id;
  dynamic appointmentId;
  dynamic patientId;
  dynamic vitalsId;
  dynamic value;
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
