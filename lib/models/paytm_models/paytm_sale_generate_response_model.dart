class PaytmSaleGenerateResponse {
  String? message;
  bool? status;
  PaytmSaleGenerateResponseData? data;

  PaytmSaleGenerateResponse({this.message, this.status, this.data});

  PaytmSaleGenerateResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? PaytmSaleGenerateResponseData.fromJson(json['data'])
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

class PaytmSaleGenerateResponseData {
  Head? head;
  Body? body;

  PaytmSaleGenerateResponseData({this.head, this.body});

  PaytmSaleGenerateResponseData.fromJson(Map<String, dynamic> json) {
    head = json['head'] != null ? Head.fromJson(json['head']) : null;
    body = json['body'] != null ? Body.fromJson(json['body']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (head != null) {
      data['head'] = head!.toJson();
    }
    if (body != null) {
      data['body'] = body!.toJson();
    }
    return data;
  }
}

class Head {
  String? responseTimestamp;
  String? channelId;
  String? version;

  Head({this.responseTimestamp, this.channelId, this.version});

  Head.fromJson(Map<String, dynamic> json) {
    responseTimestamp = json['responseTimestamp'];
    channelId = json['channelId'];
    version = json['version'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['responseTimestamp'] = responseTimestamp;
    data['channelId'] = channelId;
    data['version'] = version;
    return data;
  }
}

class Body {
  String? merchantTransactionId;
  String? paytmMid;
  String? paytmTid;
  ResultInfo? resultInfo;

  Body(
      {this.merchantTransactionId,
      this.paytmMid,
      this.paytmTid,
      this.resultInfo});

  Body.fromJson(Map<String, dynamic> json) {
    merchantTransactionId = json['merchantTransactionId'];
    paytmMid = json['paytmMid'];
    paytmTid = json['paytmTid'];
    resultInfo = json['resultInfo'] != null
        ? ResultInfo.fromJson(json['resultInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['merchantTransactionId'] = merchantTransactionId;
    data['paytmMid'] = paytmMid;
    data['paytmTid'] = paytmTid;
    if (resultInfo != null) {
      data['resultInfo'] = resultInfo!.toJson();
    }
    return data;
  }
}

class ResultInfo {
  String? resultStatus;
  String? resultCode;
  String? resultMsg;
  String? resultCodeId;

  ResultInfo(
      {this.resultStatus, this.resultCode, this.resultMsg, this.resultCodeId});

  ResultInfo.fromJson(Map<String, dynamic> json) {
    resultStatus = json['resultStatus'];
    resultCode = json['resultCode'];
    resultMsg = json['resultMsg'];
    resultCodeId = json['resultCodeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resultStatus'] = resultStatus;
    data['resultCode'] = resultCode;
    data['resultMsg'] = resultMsg;
    data['resultCodeId'] = resultCodeId;
    return data;
  }
}
