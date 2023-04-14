// To parse this JSON data, do
//
//     final saleModel = saleModelFromJson(jsonString);

import 'dart:convert';

SaleModel saleModelFromJson(String str) => SaleModel.fromJson(json.decode(str));

String saleModelToJson(SaleModel data) => json.encode(data.toJson());

class SaleModel {
    SaleModel({
        this.products,
    });

    Products? products;

    factory SaleModel.fromJson(Map<String, dynamic> json) => SaleModel(
        products: json["products"] == null ? null : Products.fromJson(json["products"]),
    );

    Map<String, dynamic> toJson() => {
        "products": products?.toJson(),
    };
}

class Products {
    Products({
        this.data,
        this.pagination,
    });

    List<Datum>? data;
    Pagination? pagination;

    factory Products.fromJson(Map<String, dynamic> json) => Products(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
        pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pagination": pagination?.toJson(),
    };
}

class Datum {
    Datum({
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

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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

class Pagination {
    Pagination({
        this.total,
        this.count,
        this.perPage,
        this.currentPage,
        this.totalPages,
    });

    int? total;
    int? count;
    int? perPage;
    int? currentPage;
    int? totalPages;

    factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        count: json["count"],
        perPage: json["per_page"],
        currentPage: json["current_page"],
        totalPages: json["total_pages"],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "count": count,
        "per_page": perPage,
        "current_page": currentPage,
        "total_pages": totalPages,
    };
}
