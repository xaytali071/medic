import 'dart:convert';

import 'shop_data.dart';

List<ProductData> productDataFromJson(String str, List<ShopData> shops) =>
    List<ProductData>.from(
        json.decode(str).map((x) => ProductData.fromJson(x, shops)));

String productDataToJson(List<ProductData> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductData {
  int? id;
  String? name;
  String? img;
  int? category;
  double? rate;
  int? order;
  int? price;
  int? hospitalId;
  String? job;
  String? workTime;
  String? phoneNumber;
  String? location;
  String? description;
  ShopData? hospital;

  ProductData({
    this.id,
    this.name,
    this.img,
    this.category,
    this.rate,
    this.order,
    this.price,
    this.hospitalId,
    this.job,
    this.workTime,
    this.phoneNumber,
    this.location,
    this.description,
    this.hospital,
  });

  ProductData copyWith({
    int? id,
    String? name,
    String? img,
    int? category,
    double? rate,
    int? order,
    int? price,
    int? hospitalId,
    String? job,
    String? workTime,
    String? phoneNumber,
    String? location,
    String? description,
    ShopData? hospital,
  }) =>
      ProductData(
        id: id ?? this.id,
        name: name ?? this.name,
        img: img ?? this.img,
        category: category ?? this.category,
        rate: rate ?? this.rate,
        order: order ?? this.order,
        price: price ?? this.price,
        hospitalId: hospitalId ?? this.hospitalId,
        job: job ?? this.job,
        workTime: workTime ?? this.workTime,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        location: location ?? this.location,
        description: description ?? this.description,
        hospital: hospital ?? this.hospital,
      );

  factory ProductData.fromJson(
      Map<String, dynamic> json, List<ShopData> shops) {
    ShopData? hospital;
    for (int i = 0; i < shops.length; i++) {
      if (shops[i].id == json["hospital_id"]) {
        hospital = shops[i];
        break;
      }
    }
    return ProductData(
      id: json["id"],
      name: json["name"],
      img: json["img"],
      category: json["category"],
      rate: json["rate"]?.toDouble(),
      order: json["order"],
      price: json["price"],
      hospitalId: json["hospital_id"],
      job: json["job"],
      workTime: json["work_time"],
      phoneNumber: json["phone_number"],
      location: json["location"],
      description: json["description"],
      hospital: hospital,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "img": img,
        "category": category,
        "rate": rate,
        "order": order,
        "price": price,
        "hospital_id": hospitalId,
        "job": job,
        "work_time": workTime,
        "phone_number": phoneNumber,
        "location": location,
        "description": description,
      };
}
