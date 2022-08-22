class UnconfirmedAppointment {
  String? message;
  bool? status;
  List<UnconfirmedAppointmentData>? data;

  UnconfirmedAppointment({this.message, this.status, this.data});

  UnconfirmedAppointment.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <UnconfirmedAppointmentData>[];
      json['data'].forEach((v) {
        data!.add(UnconfirmedAppointmentData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UnconfirmedAppointmentData {
  String? doctorId;
  String? patientId;
  String? timeslotId;
  int? appointmentStatus;
  int? paymentStatus;
  int? status;
  int? id;

  UnconfirmedAppointmentData(
      {this.doctorId,
      this.patientId,
      this.timeslotId,
      this.appointmentStatus,
      this.paymentStatus,
      this.status,
      this.id});

  UnconfirmedAppointmentData.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    patientId = json['patient_id'];
    timeslotId = json['timeslot_id'];
    appointmentStatus = json['appointment_status'];
    paymentStatus = json['payment_status'];
    status = json['status'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['doctor_id'] = doctorId;
    data['patient_id'] = patientId;
    data['timeslot_id'] = timeslotId;
    data['appointment_status'] = appointmentStatus;
    data['payment_status'] = paymentStatus;
    data['status'] = status;
    data['id'] = id;
    return data;
  }
}
