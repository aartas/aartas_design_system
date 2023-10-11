class QuickActionNotesResponse {
  String? message;
  bool? status;
  List<QuickActionsNotesData>? data;

  QuickActionNotesResponse({this.message, this.status, this.data});

  QuickActionNotesResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['data'] != null) {
      data = <QuickActionsNotesData>[];
      json['data'].forEach((v) {
        data!.add(QuickActionsNotesData.fromJson(v));
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

class QuickActionsNotesData {
  int? id;
  int? doctorId;
  String? title;
  int? categoryId;
  List<Notes>? notes;

  QuickActionsNotesData(
      {this.id, this.doctorId, this.title, this.categoryId, this.notes});

  QuickActionsNotesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    title = json['title'];
    categoryId = json['category_id'];
    if (json['notes'] != null) {
      notes = <Notes>[];
      json['notes'].forEach((v) {
        notes!.add(Notes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['title'] = title;
    data['category_id'] = categoryId;
    if (notes != null) {
      data['notes'] = notes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Notes {
  int? id;
  int? doctorQuickactionId;
  String? notes;

  Notes({
    this.id,
    this.doctorQuickactionId,
    this.notes,
  });

  Notes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorQuickactionId = json['doctor_quickaction_id'];
    notes = json['notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_quickaction_id'] = doctorQuickactionId;
    data['notes'] = notes;
    return data;
  }
}
