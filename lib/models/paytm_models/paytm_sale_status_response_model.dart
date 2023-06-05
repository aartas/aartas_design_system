class PaytmSaleStatusResponse {
  Head? head;
  Body? body;

  PaytmSaleStatusResponse({this.head, this.body});

  PaytmSaleStatusResponse.fromJson(Map<String, dynamic> json) {
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
  String? paytmMid;
  String? paytmTid;
  String? transactionDateTime;
  String? merchantTransactionId;
  ResultInfo? resultInfo;

  Body({
    this.paytmMid,
    this.paytmTid,
    this.transactionDateTime,
    this.merchantTransactionId,
    this.resultInfo,
  });

  Body.fromJson(Map<String, dynamic> json) {
    paytmMid = json['paytmMid'];
    paytmTid = json['paytmTid'];
    transactionDateTime = json['transactionDateTime'];
    merchantTransactionId = json['merchantTransactionId'];
    resultInfo = json['resultInfo'] != null
        ? ResultInfo.fromJson(json['resultInfo'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paytmMid'] = paytmMid;
    data['paytmTid'] = paytmTid;
    data['transactionDateTime'] = transactionDateTime;
    data['merchantTransactionId'] = merchantTransactionId;
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
