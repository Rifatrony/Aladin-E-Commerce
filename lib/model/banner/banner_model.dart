// To parse this JSON data, do
//
//     final bannerModel = bannerModelFromJson(jsonString);

import 'dart:convert';

BannerModel bannerModelFromJson(String str) => BannerModel.fromJson(json.decode(str));

String bannerModelToJson(BannerModel data) => json.encode(data.toJson());

class BannerModel {
    List<Datum>? data;

    BannerModel({
        this.data,
    });

    factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    String? title;
    String? url;
    String? image;

    Datum({
        this.title,
        this.url,
        this.image,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        title: json["title"],
        url: json["url"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "url": url,
        "image": image,
    };
}
