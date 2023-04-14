// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) => CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
    CategoryModel({
        this.categories,
    });

    Categories? categories;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categories: json["categories"] == null ? null : Categories.fromJson(json["categories"]),
    );

    Map<String, dynamic> toJson() => {
        "categories": categories?.toJson(),
    };
}

class Categories {
    Categories({
        this.data,
        this.pagination,
    });

    List<Datum>? data;
    Pagination? pagination;

    factory Categories.fromJson(Map<String, dynamic> json) => Categories(
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
        this.name,
        this.slug,
        this.icon,
        this.image,
        this.description,
        this.parent,
        this.child,
    });

    String? name;
    String? slug;
    String? icon;
    String? image;
    dynamic description;
    dynamic parent;
    List<dynamic>? child;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["name"],
        slug: json["slug"],
        icon: json["icon"],
        image: json["image"],
        description: json["description"],
        parent: json["parent"],
        child: json["child"] == null ? [] : List<dynamic>.from(json["child"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "icon": icon,
        "image": image,
        "description": description,
        "parent": parent,
        "child": child == null ? [] : List<dynamic>.from(child!.map((x) => x)),
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
