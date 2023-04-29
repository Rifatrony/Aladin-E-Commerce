// To parse this JSON data, do
//
//     final customOrderListModel = customOrderListModelFromJson(jsonString);

import 'dart:convert';

CustomOrderListModel customOrderListModelFromJson(String str) => CustomOrderListModel.fromJson(json.decode(str));

String customOrderListModelToJson(CustomOrderListModel data) => json.encode(data.toJson());

class CustomOrderListModel {
    List<Order>? orders;

    CustomOrderListModel({
        this.orders,
    });

    factory CustomOrderListModel.fromJson(Map<String, dynamic> json) => CustomOrderListModel(
        orders: json["orders"] == null ? [] : List<Order>.from(json["orders"]!.map((x) => Order.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "orders": orders == null ? [] : List<dynamic>.from(orders!.map((x) => x.toJson())),
    };
}

class Order {
    int? id;
    int? orderId;
    int? userId;
    Name? name;
    Email? email;
    String? phone;
    dynamic subtotal;
    dynamic total;
    String? shippingAddress;
    Status? status;
    PaymentStatus? paymentStatus;
    DateTime? createdAt;
    DateTime? updatedAt;

    Order({
        this.id,
        this.orderId,
        this.userId,
        this.name,
        this.email,
        this.phone,
        this.subtotal,
        this.total,
        this.shippingAddress,
        this.status,
        this.paymentStatus,
        this.createdAt,
        this.updatedAt,
    });

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        orderId: json["order_id"],
        userId: json["user_id"],
        name: nameValues.map[json["name"]]!,
        email: emailValues.map[json["email"]]!,
        phone: json["phone"],
        subtotal: json["subtotal"],
        total: json["total"],
        shippingAddress: json["shipping_address"],
        status: statusValues.map[json["status"]]!,
        paymentStatus: paymentStatusValues.map[json["payment_status"]]!,
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "order_id": orderId,
        "user_id": userId,
        "name": nameValues.reverse[name],
        "email": emailValues.reverse[email],
        "phone": phone,
        "subtotal": subtotal,
        "total": total,
        "shipping_address": shippingAddress,
        "status": statusValues.reverse[status],
        "payment_status": paymentStatusValues.reverse[paymentStatus],
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

enum Email { AL_GMAIL_COM, USER_MAIL_COM }

final emailValues = EnumValues({
    "al@gmail.com": Email.AL_GMAIL_COM,
    "user@mail.com": Email.USER_MAIL_COM
});

enum Name { ALIF, JONE_DOE }

final nameValues = EnumValues({
    "alif": Name.ALIF,
    "Jone Doe": Name.JONE_DOE
});

enum PaymentStatus { UNPAID }

final paymentStatusValues = EnumValues({
    "unpaid": PaymentStatus.UNPAID
});

enum Status { PENDING }

final statusValues = EnumValues({
    "pending": Status.PENDING
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
