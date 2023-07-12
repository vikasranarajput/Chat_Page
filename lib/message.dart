import 'dart:js_interop';

import 'package:flutter/material.dart';

class Message {
  Message({
    required this.toId,
    required this.msg,
    required this.read,
    required this.type,
    required this.formId,
    required this.sent,
  });
  late final String toId;
  late final String msg;
  late final String read;
  late final Type type;
  late final String formId;
  late final String sent;

  Message.fromJson(Map<String, dynamic> json) {
    toId = json["Told"].toString();
    msg = json["Msg"].toString();
    read = json["Read"].toString();
    type = json["Type"].toString() == Type.image.name ? Type.image : Type.text;
    formId = json["FromId"].toString();
    sent = json["Sent"].toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data["toId"] = toId;
    data["Msg"] = msg;
    data["Read"] = read;
    data["Type"] = type.name;
    data["FromId"] = formId;
    data["Sent"] = sent;
    return data;
  }
}

enum Type { image, text }
