class ClinicsResponse {
  String? message;
  bool? status;
  List<ClinicData>? data;

  ClinicsResponse({this.message, this.status, this.data});

  ClinicsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <ClinicData>[];
      json['data'].forEach((v) {
        data!.add(ClinicData.fromJson(v));
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

class ClinicData {
  int? id;
  String? title;
  String? slug;
  String? address;
  int? totalRooms;
  String? phoneNumber;
  String? gSTIN;
  String? stateCode;
  String? ipAddressList;
  String? latitude;
  String? longitude;
  int? locationType;
  String? mapUrl;
  String? mapId;
  String? fullAddress;
  String? image;
  String? walkthroughUrl;
  int? status;

  ClinicData({
    this.id,
    this.title,
    this.slug,
    this.address,
    this.totalRooms,
    this.phoneNumber,
    this.gSTIN,
    this.stateCode,
    this.ipAddressList,
    this.latitude,
    this.longitude,
    this.locationType,
    this.mapUrl,
    this.mapId,
    this.fullAddress,
    this.status,
    this.image,
    this.walkthroughUrl,
  });

  ClinicData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    address = json['address'];
    totalRooms = json['total_rooms'];
    phoneNumber = json['phone_number'];
    gSTIN = json['GSTIN'];
    stateCode = json['state_code'];
    ipAddressList = json['ip_address_list'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    locationType = json['location_type'];
    mapUrl = json['map_url'];
    mapId = json['map_id'];
    fullAddress = json['full_address'];
    image = json['image'];
    walkthroughUrl = json['walkthrough_url'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['address'] = address;
    data['total_rooms'] = totalRooms;
    data['phone_number'] = phoneNumber;
    data['GSTIN'] = gSTIN;
    data['state_code'] = stateCode;
    data['ip_address_list'] = ipAddressList;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['location_type'] = locationType;
    data['map_url'] = mapUrl;
    data['map_id'] = mapId;
    data['full_address'] = fullAddress;
    data['walkthrough_url'] = walkthroughUrl;
    data['image'] = image;
    data['status'] = status;
    return data;
  }
}
