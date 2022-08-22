class RewardHistoryResponse {
  String? message;
  bool? status;
  List<RewardHistoryData>? data;

  RewardHistoryResponse({this.message, this.status, this.data});

  RewardHistoryResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <RewardHistoryData>[];
      json['data'].forEach((v) {
        data!.add(RewardHistoryData.fromJson(v));
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

class RewardHistoryData {
  int? id;
  int? rewardsId;
  String? points;
  int? plusOrMinus;
  int? patientId;
  int? isPending;
  int? status;

  RewardHistoryData(
      {this.id,
      this.rewardsId,
      this.points,
      this.plusOrMinus,
      this.patientId,
      this.isPending,
      this.status});

  RewardHistoryData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    rewardsId = json['rewards_id'];
    points = json['points'];
    plusOrMinus = json['plus_or_minus'];
    patientId = json['patient_id'];
    isPending = json['is_pending'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['rewards_id'] = rewardsId;
    data['points'] = points;
    data['plus_or_minus'] = plusOrMinus;
    data['patient_id'] = patientId;
    data['is_pending'] = isPending;
    data['status'] = status;
    return data;
  }
}
