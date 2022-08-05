class PdfGenerateResponse {
  String? message;
  bool? status = false;
  PdfGenerateResponseData? data;

  PdfGenerateResponse({this.message, this.status, this.data});

  PdfGenerateResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];

    status = json['status'];

    data = json['data'] != null
        ? PdfGenerateResponseData.fromJson(json['data'])
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

class PdfGenerateResponseData {
  String? prescriptionPdf;

  PdfGenerateResponseData({this.prescriptionPdf});

  PdfGenerateResponseData.fromJson(Map<String, dynamic> json) {
    prescriptionPdf = json['prescription_pdf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['prescription_pdf'] = prescriptionPdf;

    return data;
  }
}
