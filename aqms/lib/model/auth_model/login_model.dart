// To parse this JSON data, do
//
//     final loginModel = loginModelFromMap(jsonString);

import 'dart:convert';

LoginModel loginModelFromMap(String str) => LoginModel.fromMap(json.decode(str));

String loginModelToMap(LoginModel data) => json.encode(data.toMap());

class LoginModel {
  int id;
  String nama;
  String username;
  String password;
  String rememberToken;
  String createdAt;
  String updatedAt;

  LoginModel({
    required this.id,
    required this.nama,
    required this.username,
    required this.password,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
    id: json["id"],
    nama: json["nama"],
    username: json["username"],
    password: json["password"],
    rememberToken: json["remember_token"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "nama": nama,
    "username": username,
    "password": password,
    "remember_token": rememberToken,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
