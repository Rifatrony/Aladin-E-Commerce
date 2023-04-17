// To parse this JSON data, do
//
//     final orderDetailsModel = orderDetailsModelFromJson(jsonString);

import 'dart:convert';

OrderDetailsModel orderDetailsModelFromJson(String str) => OrderDetailsModel.fromJson(json.decode(str));

String orderDetailsModelToJson(OrderDetailsModel data) => json.encode(data.toJson());

class OrderDetailsModel {
    OrderDetailsModel({
        this.id,
        this.name,
        this.email,
        this.phone,
        this.address,
        this.orderid,
        this.status,
        this.subTotal,
        this.total,
        this.paymentMethod,
        this.payment,
        this.delivery,
        this.deliveryRate,
        this.items,
    });

    String? id;
    String? name;
    String? email;
    String? phone;
    String? address;
    int? orderid;
    String? status;
    String? subTotal;
    String? total;
    dynamic paymentMethod;
    String? payment;
    String? delivery;
    String? deliveryRate;
    List<Item>? items;

    factory OrderDetailsModel.fromJson(Map<String, dynamic> json) => OrderDetailsModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        address: json["address"],
        orderid: json["orderid"],
        status: json["status"],
        subTotal: json["sub_total"],
        total: json["total"],
        paymentMethod: json["payment_method"],
        payment: json["payment"],
        delivery: json["delivery"],
        deliveryRate: json["delivery_rate"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "orderid": orderid,
        "status": status,
        "sub_total": subTotal,
        "total": total,
        "payment_method": paymentMethod,
        "payment": payment,
        "delivery": delivery,
        "delivery_rate": deliveryRate,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
    };
}

class Item {
    Item({
        this.id,
        this.name,
        this.quantity,
        this.price,
        this.total,
    });

    String? id;
    String? name;
    int? quantity;
    String? price;
    double? total;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"],
        total: json["total"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "quantity": quantity,
        "price": price,
        "total": total,
    };
}
