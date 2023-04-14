import 'dart:convert';

ProductDetailsModel productDetailsModelFromJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

String productDetailsModelToJson(ProductDetailsModel data) => json.encode(data.toJson());

class ProductDetailsModel {
    ProductDetailsModel({
        this.id,
        this.name,
        this.slug,
        this.description,
        this.sku,
        this.price,
        this.discount,
        this.discountType,
        this.finalPrice,
        this.thumbnail,
        this.image1,
        this.image2,
        this.image3,
        this.category,
        this.brand,
        this.tag,
        this.hasAttribute,
        this.attributes,
    });

    String? id;
    String? name;
    String? slug;
    String? description;
    String? sku;
    String? price;
    String? discount;
    String? discountType;
    double? finalPrice;
    String? thumbnail;
    String? image1;
    String? image2;
    String? image3;
    Category? category;
    Brand? brand;
    List<Tag>? tag;
    bool? hasAttribute;
    List<dynamic>? attributes;

    factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
        description: json["description"],
        sku: json["sku"],
        price: json["price"],
        discount: json["discount"],
        discountType: json["discount_type"],
        finalPrice: json["final_price"]?.toDouble(),
        thumbnail: json["thumbnail"],
        image1: json["image1"],
        image2: json["image2"],
        image3: json["image3"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        brand: json["brand"] == null ? null : Brand.fromJson(json["brand"]),
        tag: json["tag"] == null ? [] : List<Tag>.from(json["tag"]!.map((x) => Tag.fromJson(x))),
        hasAttribute: json["hasAttribute"],
        attributes: json["attributes"] == null ? [] : List<dynamic>.from(json["attributes"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "description": description,
        "sku": sku,
        "price": price,
        "discount": discount,
        "discount_type": discountType,
        "final_price": finalPrice,
        "thumbnail": thumbnail,
        "image1": image1,
        "image2": image2,
        "image3": image3,
        "category": category?.toJson(),
        "brand": brand?.toJson(),
        "tag": tag == null ? [] : List<dynamic>.from(tag!.map((x) => x.toJson())),
        "hasAttribute": hasAttribute,
        "attributes": attributes == null ? [] : List<dynamic>.from(attributes!.map((x) => x)),
    };
}

class Brand {
    Brand({
        this.name,
        this.slug,
        this.image,
        this.url,
    });

    String? name;
    String? slug;
    String? image;
    dynamic url;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "image": image,
        "url": url,
    };
}

class Category {
    Category({
        this.name,
        this.slug,
        this.icon,
        this.image,
        this.description,
    });

    String? name;
    String? slug;
    String? icon;
    String? image;
    dynamic description;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        slug: json["slug"],
        icon: json["icon"],
        image: json["image"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
        "icon": icon,
        "image": image,
        "description": description,
    };
}

class Tag {
    Tag({
        this.name,
        this.slug,
    });

    String? name;
    String? slug;

    factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json["name"],
        slug: json["slug"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "slug": slug,
    };
}
