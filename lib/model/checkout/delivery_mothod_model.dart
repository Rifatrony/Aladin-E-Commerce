import 'dart:convert';

List<DeliveryMethodModel> deliveryMethodModelFromJson(String str) => List<DeliveryMethodModel>.from(json.decode(str).map((x) => DeliveryMethodModel.fromJson(x)));

String deliveryMethodModelToJson(List<DeliveryMethodModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeliveryMethodModel {
    DeliveryMethodModel({
        this.id,
        this.name,
        this.rate,
    });

    String? id;
    String? name;
    String? rate;

    factory DeliveryMethodModel.fromJson(Map<String, dynamic> json) => DeliveryMethodModel(
        id: json["id"],
        name: json["name"],
        rate: json["rate"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rate": rate,
    };
}
