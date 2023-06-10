class KioskAppResponse {
  String? message;
  bool? status;
  KioskAppData? data;

  KioskAppResponse({this.message, this.status, this.data});

  KioskAppResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? KioskAppData.fromJson(json['data']) : null;
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

class KioskAppData {
  int? id;
  String? deviceId;
  String? fcmToken;
  String? title;
  int? clinicId;
  int? inPremises;

  KioskAppData({
    this.id,
    this.deviceId,
    this.fcmToken,
    this.title,
    this.clinicId,
    this.inPremises,
  });

  KioskAppData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['device_id'];
    fcmToken = json['fcm_token'];
    title = json['title'];
    clinicId = json['clinic_id'];
    inPremises = json['in_premises'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['device_id'] = deviceId;
    data['fcm_token'] = fcmToken;
    data['title'] = title;
    data['clinic_id'] = clinicId;
    data['in_premises'] = inPremises;
    return data;
  }
}
