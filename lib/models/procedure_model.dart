class ProcedureResponse {
  String? message;
  bool? status;
  ProcedureResponseData? data;

  ProcedureResponse({this.message, this.status, this.data});

  ProcedureResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? ProcedureResponseData.fromJson(json['data'])
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

class ProcedureResponseData {
  List<ProcedureList>? procedureList;

  ProcedureResponseData({this.procedureList});

  ProcedureResponseData.fromJson(Map<String, dynamic> json) {
    if (json['procedure_list'] != null) {
      procedureList = <ProcedureList>[];
      json['procedure_list'].forEach((v) {
        procedureList!.add(ProcedureList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (procedureList != null) {
      data['procedure_list'] = procedureList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProcedureList {
  int? id;
  int? doctorId;
  String? title;
  String? description;
  String? cost;
  String? totalSessions;
  String? sacNo;
  int? showCost;
  int? isTaxable;

  ProcedureList(
      {this.id,
      this.doctorId,
      this.title,
      this.description,
      this.cost,
      this.totalSessions,
      this.sacNo,
      this.showCost,
      this.isTaxable});

  ProcedureList.fromJson(Map<String, dynamic> json) {
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
