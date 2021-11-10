import 'dart:convert' as convert;

class JsRequest {
  String? callbackId;
  String? data;
  String? handlerName;

  String toJson() {
    return convert.jsonEncode({
      "callbackId": callbackId == null ? "" : callbackId,
      "data": data == null ? "" : data,
      "handlerName": handlerName == null ? "" : handlerName
    });
  }
}

class JsMsg {
  String? callbackId; //callbackId
  String? responseId; //responseId
  String? responseData; //responseData
  String? data; //data of message
  String? handlerName;

  JsMsg();

  static List<JsMsg> fromList(List list) {
    List<JsMsg> msgList = [];
    for (Map<dynamic, dynamic> json in list) {
      JsMsg msg = JsMsg.formJson(json);
      msgList.add(msg);
    }
    return msgList;
  }

  factory JsMsg.formJson(Map json) {
    JsMsg msg = JsMsg();
    msg.callbackId = json["callbackId"];
    msg.responseId = json["responseId"];
    var responseData = json["responseData"];
    msg.responseData = responseData is String
        ? responseData
        : convert.jsonEncode(responseData);
    var data = json["data"];
    msg.data = data is String ? data : convert.jsonEncode(data);
    msg.handlerName = json["handlerName"];
    return msg;
  }

  String toJson() {
    return convert.jsonEncode({
      "callbackId": callbackId == null ? "" : callbackId,
      "responseId": responseId == null ? "" : responseId,
      "responseData": responseData == null ? "" : responseData,
      "data": data == null ? "" : data,
      "handlerName": handlerName == null ? "" : handlerName
    });
  }
}
