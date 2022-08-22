class RewardPointsResponse {
  String? message;
  bool? status;
  RewardPointsData? data;

  RewardPointsResponse({this.message, this.status, this.data});

  RewardPointsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data =
        json['data'] != null ? RewardPointsData.fromJson(json['data']) : null;
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

class RewardPointsData {
  int? patientId;
  String? pointsTotal;
  int? id;

  RewardPointsData({this.patientId, this.pointsTotal, this.id});

  RewardPointsData.fromJson(Map<String, dynamic> json) {
    patientId = json['patient_id'];
    pointsTotal = json['points_total'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['patient_id'] = patientId;
    data['points_total'] = pointsTotal;
    data['id'] = id;
    return data;
  }
}
