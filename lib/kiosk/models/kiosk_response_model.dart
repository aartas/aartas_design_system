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
  String? terminalId;
  List<Assets>? assets;

  KioskAppData({
    this.id,
    this.deviceId,
    this.fcmToken,
    this.title,
    this.clinicId,
    this.inPremises,
    this.terminalId,
    this.assets,
  });

  KioskAppData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['device_id'];
    fcmToken = json['fcm_token'];
    title = json['title'];
    clinicId = json['clinic_id'];
    inPremises = json['in_premises'];
    terminalId = json['terminal_id'];
    if (json['assets'] != null) {
      assets = <Assets>[];
      json['assets'].forEach((v) {
        assets!.add(Assets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['device_id'] = deviceId;
    data['fcm_token'] = fcmToken;
    data['title'] = title;
    data['clinic_id'] = clinicId;
    data['in_premises'] = inPremises;
    data['terminal_id'] = terminalId;
    if (assets != null) {
      data['assets'] = assets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Assets {
  int? id;
  int? kioskId;
  int? assetsId;
  AssetDetails? assetDetails;

  Assets({this.id, this.kioskId, this.assetsId, this.assetDetails});

  Assets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kioskId = json['kiosk_id'];
    assetsId = json['assets_id'];
    assetDetails = json['asset_details'] != null
        ? AssetDetails.fromJson(json['asset_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['kiosk_id'] = kioskId;
    data['assets_id'] = assetsId;
    if (assetDetails != null) {
      data['asset_details'] = assetDetails!.toJson();
    }
    return data;
  }
}

class AssetDetails {
  int? id;
  String? title;
  String? file;
  String? filePath;
  int? fileType;

  AssetDetails({this.id, this.title, this.file, this.filePath, this.fileType});

  AssetDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    file = json['file'];
    filePath = json['file_path'];
    fileType = json['file_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['file'] = file;
    data['file_path'] = filePath;
    data['file_type'] = fileType;
    return data;
  }
}
