class Version {
  String? message = "";
  bool? status = true;
  VersionData? data;

  Version({this.message, this.status, this.data});

  Version.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? VersionData.fromJson(json['data']) : null;
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

class VersionData {
  List<VersionList>? versionList;

  VersionData({this.versionList});

  VersionData.fromJson(Map<String, dynamic> json) {
    if (json['version_list'] != null) {
      versionList = <VersionList>[];
      json['version_list'].forEach((v) {
        versionList!.add(VersionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (versionList != null) {
      data['version_list'] = versionList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VersionList {
  int? id;
  String? title;
  String? value;
  int? status;

  VersionList({this.id, this.title, this.value, this.status});

  VersionList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    value = json['value'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['value'] = value;
    data['status'] = status;
    return data;
  }
}
