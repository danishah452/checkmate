// To parse this JSON data, do
//
//     final getorders = getordersFromJson(jsonString);

import 'dart:convert';

Getorders getordersFromJson(String str) => Getorders.fromJson(json.decode(str));

String getordersToJson(Getorders data) => json.encode(data.toJson());

class Getorders {
  Getorders({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  List<Datum>? data;

  factory Getorders.fromJson(Map<String, dynamic> json) => Getorders(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    this.id,
    this.userId,
    this.showroomId,
    this.fabricCode,
    this.customerFabric,
    this.productCode,
    this.productLink,
    this.deliveryDate,
    this.tryDate,
    this.paymentMethod,
    this.advancePaid,
    this.decidedTotal,
    this.address,
    this.orderStatues,
    this.orderMeasurements,
    this.fabricImages,
    this.productImages,
  });

  int? id;
  int? userId;
  int? showroomId;
  String? fabricCode;
  String? customerFabric;
  String? productCode;
  String? productLink;
  String? deliveryDate;
  DateTime? tryDate;
  String? paymentMethod;
  String? advancePaid;
  String? decidedTotal;
  String? address;
  List<OrderStatue>? orderStatues;
  List<OrderMeasurement>? orderMeasurements;
  List<Image>? fabricImages;
  List<Image>? productImages;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["userId"],
    showroomId: json["showroomId"],
    fabricCode: json["fabricCode"],
    customerFabric: json["customerFabric"],
    productCode: json["productCode"],
    productLink: json["productLink"],
    deliveryDate: json["deliveryDate"],
    tryDate: DateTime.parse(json["tryDate"]),
    paymentMethod: json["paymentMethod"],
    advancePaid: json["advancePaid"],
    decidedTotal: json["decidedTotal"],
    address: json["address"],
    orderStatues: List<OrderStatue>.from(json["orderStatues"].map((x) => OrderStatue.fromJson(x))),
    orderMeasurements: List<OrderMeasurement>.from(json["orderMeasurements"].map((x) => OrderMeasurement.fromJson(x))),
    fabricImages: List<Image>.from(json["fabricImages"].map((x) => Image.fromJson(x))),
    productImages: List<Image>.from(json["productImages"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "showroomId": showroomId,
    "fabricCode": fabricCode,
    "customerFabric": customerFabric,
    "productCode": productCode,
    "productLink": productLink,
    "deliveryDate": deliveryDate,
    "tryDate": "${tryDate?.year.toString().padLeft(4, '0')}-${tryDate?.month.toString().padLeft(2, '0')}-${tryDate?.day.toString().padLeft(2, '0')}",
    "paymentMethod": paymentMethod,
    "advancePaid": advancePaid,
    "decidedTotal": decidedTotal,
    "address": address,
    "orderStatues": List<dynamic>.from(orderStatues!.map((x) => x.toJson())),
    "orderMeasurements": List<dynamic>.from(orderMeasurements!.map((x) => x.toJson())),
    "fabricImages": List<dynamic>.from(fabricImages!.map((x) => x.toJson())),
    "productImages": List<dynamic>.from(productImages!.map((x) => x.toJson())),
  };
}

class Image {
  Image({
    this.id,
    this.type,
    this.path,
  });

  int? id;
  String? type;
  String? path;

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    id: json["id"],
    type: json["type"],
    path: json["path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "path": path,
  };
}

class OrderMeasurement {
  OrderMeasurement({
    this.id,
    this.orderId,
    this.measurement,
  });

  int? id;
  int? orderId;
  Measurement? measurement;

  factory OrderMeasurement.fromJson(Map<String, dynamic> json) => OrderMeasurement(
    id: json["id"],
    orderId: json["order_id"],
    measurement: Measurement.fromJson(json["measurement"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "measurement": measurement?.toJson(),
  };
}

class Measurement {
  Measurement({
    this.id,
    this.userId,
    this.category,
    this.measurement,
    this.createdAt,
  });

  int? id;
  int? userId;
  String? category;
  String? measurement;
  DateTime? createdAt;

  factory Measurement.fromJson(Map<String, dynamic> json) => Measurement(
    id: json["id"],
    userId: json["userId"],
    category: json["category"],
    measurement: json["measurement"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "userId": userId,
    "category": category,
    "measurement": measurement,
    "createdAt": createdAt?.toIso8601String(),
  };
}

class OrderStatue {
  OrderStatue({
    this.id,
    this.orderId,
    this.status,
    this.createdAt,
  });

  int? id;
  int? orderId;
  String? status;
  DateTime? createdAt;

  factory OrderStatue.fromJson(Map<String, dynamic> json) => OrderStatue(
    id: json["id"],
    orderId: json["orderId"],
    status: json["status"],
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "orderId": orderId,
    "status": status,
    "createdAt": createdAt?.toIso8601String(),
  };
}
