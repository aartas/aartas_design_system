class HomeFeedLikeResponse {
  String? message;
  bool? status;
  HomeFeedLikeData? data;

  HomeFeedLikeResponse({this.message, this.status, this.data});

  HomeFeedLikeResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data =
        json['data'] != null ? HomeFeedLikeData.fromJson(json['data']) : null;
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

class HomeFeedLikeData {
  int? isLiked;

  HomeFeedLikeData({this.isLiked});

  HomeFeedLikeData.fromJson(Map<String, dynamic> json) {
    isLiked = json['is_liked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['is_liked'] = isLiked;
    return data;
  }
}
