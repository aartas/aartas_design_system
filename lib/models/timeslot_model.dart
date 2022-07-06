class Timeslot {
  int? id;
  dynamic doctorId;
  dynamic date;
  dynamic timeFrom;
  dynamic timeTo;
  dynamic clinicId;
  dynamic bookingStatus;

  Timeslot(
      {this.id,
      this.doctorId,
      this.date,
      this.timeFrom,
      this.timeTo,
      this.clinicId,
      this.bookingStatus});

  Timeslot.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    date = json['date'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    clinicId = json['clinic_id'];
    bookingStatus = json['booking_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['date'] = date;
    data['time_from'] = timeFrom;
    data['time_to'] = timeTo;
    data['clinic_id'] = clinicId;
    data['booking_status'] = bookingStatus;
    return data;
  }
}
