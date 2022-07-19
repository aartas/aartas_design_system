class Response {
  String? message;

  bool? status;

  List<dynamic>? data;

  Response({this.message, this.status, this.data});

  Response.fromJson(Map<String, dynamic> json) {
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
