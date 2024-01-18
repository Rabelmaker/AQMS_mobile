// To parse this JSON data, do
//
//     final grafikModel = grafikModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

GrafikModel grafikModelFromMap(String str) => GrafikModel.fromMap(json.decode(str));

String grafikModelToMap(GrafikModel data) => json.encode(data.toMap());

class GrafikModel {
  double avgIspupm25;
  double avgIspupm10;
  double avgIspuozon;
  double avgIspuco;

  GrafikModel({
    required this.avgIspupm25,
    required this.avgIspupm10,
    required this.avgIspuozon,
    required this.avgIspuco,
  });

  factory GrafikModel.fromMap(Map<String, dynamic> json) => GrafikModel(
    avgIspupm25: json["avg_ispupm25"]?.toDouble() ?? 0.0,
    avgIspupm10: json["avg_ispupm10"]?.toDouble() ?? 0.0,
    avgIspuozon: json["avg_ispuozon"]?.toDouble() ?? 0.0,
    avgIspuco: json["avg_ispuco"]?.toDouble() ?? 0.0,
  );

  Map<String, dynamic> toMap() => {
    "avg_ispupm25": avgIspupm25,
    "avg_ispupm10": avgIspupm10,
    "avg_ispuozon": avgIspuozon,
    "avg_ispuco": avgIspuco,
  };
}
