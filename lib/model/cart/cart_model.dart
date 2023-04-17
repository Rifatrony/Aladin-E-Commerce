// To parse this JSON data, do
//
//     final cartModel = cartModelFromJson(jsonString);

import 'dart:convert';

CartModel cartModelFromJson(String str) => CartModel.fromJson(json.decode(str));

String cartModelToJson(CartModel data) => json.encode(data.toJson());

class CartModel {
    CartModel({
        this.data,
    });

    List<Datum>? data;

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.quantity,
        this.price,
        this.total,
        this.product,
    });

    int? quantity;
    String? price;
    double? total;
    Product? product;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        quantity: json["quantity"],
        price: json["price"],
        total: json["total"]?.toDouble(),
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
    );

    Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "price": price,
        "total": total,
        "product": product?.toJson(),
    };
}

class Product {
    Product({
        this.id,
        this.name,
        this.slug,
        this.thumbnail,
        this.discount,
        this.price,
        this.discountedPrice,
        this.hasAttribute,
    });

    String? id;
    String? name;
    String? slug;
    String? thumbnail;
    String? discount;
    String? price;
    double? discountedPrice;
    bool? hasAttribute;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        thumbnail: json["thumbnail"],
        discount: json["discount"],
        price: json["price"],
        discountedPrice: json["discounted_price"]?.toDouble(),
        hasAttribute: json["has_attribute"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "thumbnail": thumbnail,
        "discount": discount,
        "price": price,
        "discounted_price": discountedPrice,
        "has_attribute": hasAttribute,
    };
}
