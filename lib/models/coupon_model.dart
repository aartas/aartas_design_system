class CouponResponse {
  String? message;
  bool? status;
  CouponData? data;

  CouponResponse({this.message, this.status, this.data});

  CouponResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null ? CouponData.fromJson(json['data']) : null;
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

class CouponData {
  List<Coupon>? coupon;

  CouponData({this.coupon});

  CouponData.fromJson(Map<String, dynamic> json) {
    if (json['coupon'] != null) {
      coupon = <Coupon>[];
      json['coupon'].forEach((v) {
        coupon!.add(Coupon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coupon != null) {
      data['coupon'] = coupon!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Coupon {
  int? id;
  String? name;
  String? image;
  String? description;
  int? couponType;
  int? patientId;
  String? value;
  int? privateCoupon;
  int? doctorId;
  int? specialityId;
  String? referenceBy;
  String? expiryDate;

  Coupon(
      {this.id,
      this.name,
      this.image,
      this.description,
      this.couponType,
      this.patientId,
      this.value,
      this.privateCoupon,
      this.doctorId,
      this.specialityId,
      this.referenceBy,
      this.expiryDate});

  Coupon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    couponType = json['coupon_type'];
    patientId = json['patient_id'];
    value = json['value'];
    privateCoupon = json['private_coupon'];
    doctorId = json['doctor_id'];
    specialityId = json['speciality_id'];
    referenceBy = json['reference_by'];
    expiryDate = json['expiry_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['coupon_type'] = couponType;
    data['patient_id'] = patientId;
    data['value'] = value;
    data['private_coupon'] = privateCoupon;
    data['doctor_id'] = doctorId;
    data['speciality_id'] = specialityId;
    data['reference_by'] = referenceBy;
    data['expiry_date'] = expiryDate;
    return data;
  }
}
//


// class CouponResponse {
//   String? message;
//   bool? status;
//   CouponData? data;

//   CouponResponse({this.message, this.status, this.data});

//   CouponResponse.fromJson(Map<String, dynamic> json) {
//     message = json['message'];
//     status = json['status'];
//     data = json['data'] != null ? CouponData.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['message'] = message;
//     data['status'] = status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class CouponData {
//   List<Coupon>? coupon;

//   CouponData({this.coupon});

//   CouponData.fromJson(Map<String, dynamic> json) {
//     if (json['coupon'] != null) {
//       coupon = <Coupon>[];
//       json['coupon'].forEach((v) {
//         coupon!.add(Coupon.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (coupon != null) {
//       data['coupon'] = coupon!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Coupon {
//   int? id;
//   String? name;
//   String? description;
//   int? couponType;
//   int? patientId;
//   String? value;
//   int? doctorId;
//   int? specialityId;
//   String? referenceBy;
//   String? expiryDate;
//   int? status;

//   Coupon(
//       {this.id,
//       this.name,
//       this.description,
//       this.couponType,
//       this.patientId,
//       this.value,
//       this.doctorId,
//       this.specialityId,
//       this.referenceBy,
//       this.expiryDate,
//       this.status});

//   Coupon.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     description = json['description'];
//     couponType = json['coupon_type'];
//     patientId = json['patient_id'];
//     value = json['value'];
//     doctorId = json['doctor_id'];
//     specialityId = json['speciality_id'];
//     referenceBy = json['reference_by'];
//     expiryDate = json['expiry_date'];
//     status = json['status'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['description'] = description;
//     data['coupon_type'] = couponType;
//     data['patient_id'] = patientId;
//     data['value'] = value;
//     data['doctor_id'] = doctorId;
//     data['speciality_id'] = specialityId;
//     data['reference_by'] = referenceBy;
//     data['expiry_date'] = expiryDate;
//     data['status'] = status;
//     return data;
//   }
// }
