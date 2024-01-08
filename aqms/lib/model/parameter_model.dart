// To parse this JSON data, do
//
//     final parameterModel = parameterModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ParameterModel parameterModelFromMap(String str) => ParameterModel.fromMap(json.decode(str));

String parameterModelToMap(ParameterModel data) => json.encode(data.toMap());

class ParameterModel {
  bool status;
  String pesan;
  List<Datum> data;

  ParameterModel({
    required this.status,
    required this.pesan,
    required this.data,
  });

  factory ParameterModel.fromMap(Map<String, dynamic> json) => ParameterModel(
    status: json["status"],
    pesan: json["pesan"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "status": status,
    "pesan": pesan,
    "data": List<dynamic>.from(data.map((x) => x.toMap())),
  };
}

class Datum {
  int id;
  int idAlat;
  int temp;
  int hum;
  double pm25;
  int pm10;
  int voc;
  int ozon;
  double ispupm10;
  double ispupm25;
  double ispuozon;
  double ispuvoc;
  String kualitas;
  String createdAt;
  String updatedAt;

  Datum({
    required this.id,
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

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
    id: json["id"],
    idAlat: json["id_alat"],
    temp: json["temp"],
    hum: json["hum"],
    pm25: json["pm25"]?.toDouble(),
    pm10: json["pm10"],
    voc: json["voc"],
    ozon: json["ozon"],
    ispupm10: json["ispupm10"]?.toDouble(),
    ispupm25: json["ispupm25"]?.toDouble(),
    ispuozon: json["ispuozon"]?.toDouble(),
    ispuvoc: json["ispuvoc"]?.toDouble(),
    kualitas: json["kualitas"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
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
