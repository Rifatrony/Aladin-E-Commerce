import 'dart:convert';

OrderModel orderModelFromJson(String str) => OrderModel.fromJson(json.decode(str));

String orderModelToJson(OrderModel data) => json.encode(data.toJson());

class OrderModel {
    OrderModel({
        this.data,
        this.pagination,
    });

    List<Datum>? data;
    Pagination? pagination;

    factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
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
        this.orderid,
        this.status,
        this.amount,
        this.payment,
        this.quantity,
    });

    String? id;
    int? orderid;
    String? status;
    double? amount;
    String? payment;
    int? quantity;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        orderid: json["orderid"],
        status: json["status"],
        amount: json["amount"]?.toDouble(),
        payment: json["payment"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "orderid": orderid,
        "status": status,
        "amount": amount,
        "payment": payment,
        "quantity": quantity,
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
