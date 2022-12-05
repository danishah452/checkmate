// To parse this JSON data, do
//
//     final loginSignupResponseModel = loginSignupResponseModelFromJson(jsonString);

import 'dart:convert';

LoginSignupResponseModel loginSignupResponseModelFromJson(String str) => LoginSignupResponseModel.fromJson(json.decode(str));

String loginSignupResponseModelToJson(LoginSignupResponseModel data) => json.encode(data.toJson());

class LoginSignupResponseModel {
  LoginSignupResponseModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory LoginSignupResponseModel.fromJson(Map<String, dynamic> json) => LoginSignupResponseModel(
    status: json["status"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  Data({
    this.user,
    this.token,
  });

  User? user;
  String? token;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: User.fromJson(json["user"]),
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "user": user?.toJson(),
    "token": token,
  };
}

class User {
  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.role,
    this.emailVerifiedAt,
    this.deviceKey,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? name;
  String? email;
  dynamic phone;
  String? role;
  DateTime? emailVerifiedAt;
  String? deviceKey;
  dynamic createdAt;
  DateTime? updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    role: json["role"],
    emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
    deviceKey: json["deviceKey"],
    createdAt: json["created_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "role": role,
    "email_verified_at": emailVerifiedAt?.toIso8601String(),
    "deviceKey": deviceKey,
    "created_at": createdAt,
    "updated_at": updatedAt?.toIso8601String(),
  };
}
