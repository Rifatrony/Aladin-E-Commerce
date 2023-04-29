// To parse this JSON data, do
//
//     final customOrderDetailsModel = customOrderDetailsModelFromJson(jsonString);

import 'dart:convert';

CustomOrderDetailsModel customOrderDetailsModelFromJson(String str) => CustomOrderDetailsModel.fromJson(json.decode(str));

String customOrderDetailsModelToJson(CustomOrderDetailsModel data) => json.encode(data.toJson());

class CustomOrderDetailsModel {
    int? orderId;
    String? name;
    String? email;
    String? phone;
    DateTime? dateTime;
    String? status;
    String? product;
    String? image;

    CustomOrderDetailsModel({
        this.orderId,
        this.name,
        this.email,
        this.phone,
        this.dateTime,
        this.status,
        this.product,
        this.image,
    });

    factory CustomOrderDetailsModel.fromJson(Map<String, dynamic> json) => CustomOrderDetailsModel(
        orderId: json["order_id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        dateTime: json["dateTime"] == null ? null : DateTime.parse(json["dateTime"]),
        status: json["status"],
        product: json["product"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "order_id": orderId,
        "name": name,
        "email": email,
        "phone": phone,
        "dateTime": dateTime?.toIso8601String(),
        "status": status,
        "product": product,
        "image": image,
    };
}
