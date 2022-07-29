class DiagnosisResponse {
  String? message;
  bool? status = false;
  DiagnosisResponseData? data;

  DiagnosisResponse({this.message, this.status, this.data});

  DiagnosisResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? DiagnosisResponseData.fromJson(json['data'])
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

class DiagnosisResponseData {
  List<Diagnosis>? diagnosis;

  DiagnosisResponseData({this.diagnosis});

  DiagnosisResponseData.fromJson(Map<String, dynamic> json) {
    if (json['diagnosis'] != null) {
      diagnosis = <Diagnosis>[];
      json['diagnosis'].forEach((v) {
        diagnosis!.add(Diagnosis.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (diagnosis != null) {
      data['diagnosis'] = diagnosis!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Diagnosis {
  int? id;
  String? title;

  Diagnosis({this.id, this.title});

  Diagnosis.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    return data;
  }
}
