import 'dart:convert';

import 'package:medic/model/models/product_data.dart';

import 'chat_data.dart';

List<MessageData> messageDataFromJson(String str, List<ProductData> shops) =>
    List<MessageData>.from(
        json.decode(str).map((x) => MessageData.fromJson(x, shops)));

String messageDataToJson(List<MessageData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MessageData {
  int? shopId;
  ProductData? doctors;
  List<ChatData>? chats;

  MessageData({
    this.shopId,
    this.chats,
    this.doctors,
  });

  MessageData copyWith({
    int? shopId,
    ProductData? doctors,
    List<ChatData>? chats,
  }) =>
      MessageData(
        shopId: shopId ?? this.shopId,
        chats: chats ?? this.chats,
        doctors: doctors ?? this.doctors,
      );

  factory MessageData.fromJson(
      Map<String, dynamic> json, List<ProductData> shops) {
    ProductData? shopData;
    for (int i = 0; i < shops.length; i++) {
      if (shops[i].id == json["shopId"]) {
        shopData = shops[i];
        break;
      }
    }
    return MessageData(
        shopId: json["shopId"],
        chats: json["data"] == null
            ? []
            : List<ChatData>.from(
                json["data"]!.map((x) => ChatData.fromJson(x)),
              ),
        doctors: shopData);
  }

  Map<String, dynamic> toJson() => {
        "shopId": shopId,
        "data": chats == null
            ? []
            : List<dynamic>.from(chats!.map((x) => x.toJson())),
      };
}
