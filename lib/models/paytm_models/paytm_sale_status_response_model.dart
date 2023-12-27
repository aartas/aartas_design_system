class PaytmSaleStatusResponse {
  String? message;
  bool? status;
  PaytmSaleStatusResponseData? data;

  PaytmSaleStatusResponse({this.message, this.status, this.data});

  PaytmSaleStatusResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    data = json['data'] != null
        ? PaytmSaleStatusResponseData.fromJson(json['data'])
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

class PaytmSaleStatusResponseData {
  Head? head;
  Body? body;

  PaytmSaleStatusResponseData({this.head, this.body});

  PaytmSaleStatusResponseData.fromJson(Map<String, dynamic> json) {
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
  dynamic merchantReferenceNo;
  dynamic transactionAmount;
  dynamic acquirementId;
  dynamic retrievalReferenceNo;
  dynamic authCode;
  dynamic issuerMaskCardNo;
  dynamic issuingBankName;
  dynamic bankResponseCode;
  dynamic bankResponseMessage;
  dynamic bankMid;
  dynamic bankTid;
  ResultInfo? resultInfo;
  dynamic acquiringBank;
  dynamic merchantExtendedInfo;
  dynamic extendedInfo;
  String? aid;
  dynamic payMethod;
  dynamic cardType;
  dynamic cardScheme;

  Body({
    this.paytmMid,
    this.paytmTid,
    this.transactionDateTime,
    this.merchantTransactionId,
    this.merchantReferenceNo,
    this.transactionAmount,
    this.acquirementId,
    this.retrievalReferenceNo,
    this.authCode,
    this.issuerMaskCardNo,
    this.issuingBankName,
    this.bankResponseCode,
    this.bankResponseMessage,
    this.bankMid,
    this.bankTid,
    this.resultInfo,
    this.acquiringBank,
    this.merchantExtendedInfo,
    this.extendedInfo,
    this.aid,
    this.payMethod,
    this.cardType,
    this.cardScheme,
  });

  Body.fromJson(Map<String, dynamic> json) {
    paytmMid = json['paytmMid'];
    paytmTid = json['paytmTid'];
    transactionDateTime = json['transactionDateTime'];
    merchantTransactionId = json['merchantTransactionId'];
    merchantReferenceNo = json['merchantReferenceNo'];
    transactionAmount = json['transactionAmount'];
    acquirementId = json['acquirementId'];
    retrievalReferenceNo = json['retrievalReferenceNo'];
    authCode = json['authCode'];
    issuerMaskCardNo = json['issuerMaskCardNo'];
    issuingBankName = json['issuingBankName'];
    bankResponseCode = json['bankResponseCode'];
    bankResponseMessage = json['bankResponseMessage'];
    bankMid = json['bankMid'];
    bankTid = json['bankTid'];
    resultInfo = json['resultInfo'] != null
        ? ResultInfo.fromJson(json['resultInfo'])
        : null;
    acquiringBank = json['acquiringBank'];
    merchantExtendedInfo = json['merchantExtendedInfo'];
    extendedInfo = json['extendedInfo'];
    aid = json['aid'];
    payMethod = json['payMethod'];
    cardType = json['cardType'];
    cardScheme = json['cardScheme'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['paytmMid'] = paytmMid;
    data['paytmTid'] = paytmTid;
    data['transactionDateTime'] = transactionDateTime;
    data['merchantTransactionId'] = merchantTransactionId;
    data['merchantReferenceNo'] = merchantReferenceNo;
    data['transactionAmount'] = transactionAmount;
    data['acquirementId'] = acquirementId;
    data['retrievalReferenceNo'] = retrievalReferenceNo;
    data['authCode'] = authCode;
    data['issuerMaskCardNo'] = issuerMaskCardNo;
    data['issuingBankName'] = issuingBankName;
    data['bankResponseCode'] = bankResponseCode;
    data['bankResponseMessage'] = bankResponseMessage;
    data['bankMid'] = bankMid;
    data['bankTid'] = bankTid;
    if (resultInfo != null) {
      data['resultInfo'] = resultInfo!.toJson();
    }
    data['acquiringBank'] = acquiringBank;
    data['merchantExtendedInfo'] = merchantExtendedInfo;
    data['extendedInfo'] = extendedInfo;
    data['aid'] = aid;
    data['payMethod'] = payMethod;
    data['cardType'] = cardType;
    data['cardScheme'] = cardScheme;

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
