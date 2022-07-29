class InvestigationsResponse {
  String? message;
  bool? status = false;
  InvestigationsResponseData? data;

  InvestigationsResponse({this.message, this.status, this.data});

  InvestigationsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? InvestigationsResponseData.fromJson(json['data'])
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

class InvestigationsResponseData {
  List<Investigations>? investigations;

  InvestigationsResponseData({this.investigations});

  InvestigationsResponseData.fromJson(Map<String, dynamic> json) {
    if (json['investigations'] != null) {
      investigations = <Investigations>[];
      json['investigations'].forEach((v) {
        investigations!.add(Investigations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (investigations != null) {
      data['investigations'] = investigations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Investigations {
  int? id;
  String? title;

  Investigations({this.id, this.title});

  Investigations.fromJson(Map<String, dynamic> json) {
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
