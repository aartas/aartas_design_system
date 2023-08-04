class DoctorProcedureResponse {
  String? message;
  bool? status;
  DoctorProcedureData? data;

  DoctorProcedureResponse({this.message, this.status, this.data});

  DoctorProcedureResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? DoctorProcedureData.fromJson(json['data'])
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

class DoctorProcedureData {
  Procedure? procedure;

  DoctorProcedureData({this.procedure});

  DoctorProcedureData.fromJson(Map<String, dynamic> json) {
    procedure = json['procedure'] != null
        ? Procedure.fromJson(json['procedure'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (procedure != null) {
      data['procedure'] = procedure!.toJson();
    }
    return data;
  }
}

class Procedure {
  int? id;
  int? doctorId;
  String? title;
  dynamic description;
  dynamic cost;
  dynamic totalSessions;
  dynamic sacNo;
  int? showCost;
  int? isTaxable;

  Procedure(
      {this.id,
      this.doctorId,
      this.title,
      this.description,
      this.cost,
      this.totalSessions,
      this.sacNo,
      this.showCost,
      this.isTaxable});

  Procedure.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    title = json['title'];
    description = json['description'];
    cost = json['cost'];
    totalSessions = json['total_sessions'];
    sacNo = json['sac_no'];
    showCost = json['show_cost'];
    isTaxable = json['is_taxable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['title'] = title;
    data['description'] = description;
    data['cost'] = cost;
    data['total_sessions'] = totalSessions;
    data['sac_no'] = sacNo;
    data['show_cost'] = showCost;
    data['is_taxable'] = isTaxable;
    return data;
  }
}
