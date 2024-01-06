// To parse this JSON data, do
//
//     final alatModel = alatModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AlatModel alatModelFromMap(String str) => AlatModel.fromMap(json.decode(str));

String alatModelToMap(AlatModel data) => json.encode(data.toMap());

class AlatModel {
  int id;
  String code;
  String alamat;
  double lat;
  double lon;
  String createdAt;
  String updatedAt;

  AlatModel({
    required this.id,
    required this.code,
    required this.alamat,
    required this.lat,
    required this.lon,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AlatModel.fromMap(Map<String, dynamic> json) => AlatModel(
    id: json["id"],
    code: json["code"],
    alamat: json["alamat"],
    lat: json["lat"]?.toDouble(),
    lon: json["lon"]?.toDouble(),
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "code": code,
    "alamat": alamat,
    "lat": lat,
    "lon": lon,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
