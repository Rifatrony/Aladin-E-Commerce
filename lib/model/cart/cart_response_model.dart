// To parse this JSON data, do
//
//     final cartResponseModel = cartResponseModelFromJson(jsonString);

import 'dart:convert';

CartResponseModel cartResponseModelFromJson(String str) => CartResponseModel.fromJson(json.decode(str));

String cartResponseModelToJson(CartResponseModel data) => json.encode(data.toJson());

class CartResponseModel {
    CartResponseModel({
        this.data,
    });

    Data? data;

    factory CartResponseModel.fromJson(Map<String, dynamic> json) => CartResponseModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    Data({
        this.quantity,
        this.price,
        this.total,
        this.product,
    });

    int? quantity;
    int? price;
    int? total;
    Product? product;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        quantity: json["quantity"],
        price: json["price"],
        total: json["total"],
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
    int? discountedPrice;
    bool? hasAttribute;

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        thumbnail: json["thumbnail"],
        discount: json["discount"],
        price: json["price"],
        discountedPrice: json["discounted_price"],
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
