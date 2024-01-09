// To parse this JSON data, do
//
//     final registrasiModel = registrasiModelFromMap(jsonString);

import 'dart:convert';

RegistrasiModel registrasiModelFromMap(String str) => RegistrasiModel.fromMap(json.decode(str));

String registrasiModelToMap(RegistrasiModel data) => json.encode(data.toMap());

class RegistrasiModel {
  int id;
  String nama;
  String username;
  String password;

  RegistrasiModel({
    required this.id,
    required this.nama,
    required this.username,
    required this.password,
  });

  factory RegistrasiModel.fromMap(Map<String, dynamic> json) => RegistrasiModel(
    id: json["user_id"],
    nama: json["nama"],
    username: json["username"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "user_id": id,
    "nama": nama,
    "username": username,
    "password": password,
  };
}
