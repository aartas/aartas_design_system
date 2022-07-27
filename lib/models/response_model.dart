class ResponseModel {
  String? message = "?";
  bool? status = false;
  List<dynamic>? data = [];

  ResponseModel({
    this.message,
    this.status,
    this.data,
  });

  ResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    data['data'] = data;

    return data;
  }
}
