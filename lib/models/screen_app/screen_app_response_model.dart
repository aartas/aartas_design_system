class ScreenAppResponse {
  String? message;
  bool? status;
  ScreenAppData? data;

  ScreenAppResponse({this.message, this.status, this.data});

  ScreenAppResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? ScreenAppData.fromJson(json['data']) : null;
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

class ScreenAppData {
  String? deviceId;

  ScreenAppData({this.deviceId});

  ScreenAppData.fromJson(Map<String, dynamic> json) {
    deviceId = json['device_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['device_id'] = deviceId;
    return data;
  }
}
