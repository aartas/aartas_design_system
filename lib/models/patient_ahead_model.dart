class PatientAheadResponse {
  String? message;
  bool? status;
  PatientAheadResponseData? data;

  PatientAheadResponse({this.message, this.status, this.data});

  PatientAheadResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? PatientAheadResponseData.fromJson(json['data'])
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

class PatientAheadResponseData {
  int? totalPatientAhead;

  PatientAheadResponseData({this.totalPatientAhead});

  PatientAheadResponseData.fromJson(Map<String, dynamic> json) {
    totalPatientAhead = json['total_patient_ahead'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_patient_ahead'] = totalPatientAhead;
    return data;
  }
}
