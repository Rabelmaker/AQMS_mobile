// To parse this JSON data, do
//
//     final parameterModel = parameterModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ParameterModel parameterModelFromMap(String str) => ParameterModel.fromMap(json.decode(str));

String parameterModelToMap(ParameterModel data) => json.encode(data.toMap());

class ParameterModel {
  int id;
  String alamat;
  String code;
  int idAlat;
  double temp;
  double hum;
  double pm25;
  double pm10;
  double voc;
  double ozon;
  double ispupm10;
  double ispupm25;
  double ispuozon;
  double ispuvoc;
  String kualitas;
  String createdAt;
  String updatedAt;

  ParameterModel({
    required this.id,
    required this.alamat,
    required this.code,
    required this.idAlat,
    required this.temp,
    required this.hum,
    required this.pm25,
    required this.pm10,
    required this.voc,
    required this.ozon,
    required this.ispupm10,
    required this.ispupm25,
    required this.ispuozon,
    required this.ispuvoc,
    required this.kualitas,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ParameterModel.fromMap(Map<String, dynamic> json) => ParameterModel(
    id: json["id"] ?? 0,
    alamat: json["alamat"] ??"",
    code: json["code"] ??"",
    idAlat: json["id_alat"] ?? 0,
    temp: json["temp"]?.toDouble() ?? 0.0,
    hum: json["hum"]?.toDouble() ??  0.0,
    pm25: json["pm25"]?.toDouble() ?? 0.0,
    pm10: json["pm10"]?.toDouble() ?? 0.0,
    voc: json["voc"]?.toDouble() ?? 0.0,
    ozon: json["ozon"]?.toDouble() ?? 0.0,
    ispupm10: json["ispupm10"]?.toDouble() ?? 0.0,
    ispupm25: json["ispupm25"]?.toDouble() ?? 0.0,
    ispuozon: json["ispuozon"]?.toDouble() ?? 0.0,
    ispuvoc: json["ispuvoc"]?.toDouble() ?? 0.0,
    kualitas: json["kualitas"] ?? "",
    createdAt: json["created_at"] ??"",
    updatedAt: json["updated_at"] ?? "",
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "id_alat": idAlat,
    "temp": temp,
    "hum": hum,
    "pm25": pm25,
    "pm10": pm10,
    "voc": voc,
    "ozon": ozon,
    "ispupm10": ispupm10,
    "ispupm25": ispupm25,
    "ispuozon": ispuozon,
    "ispuvoc": ispuvoc,
    "kualitas": kualitas,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
