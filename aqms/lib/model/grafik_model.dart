
import 'dart:convert';

GrafikModel grafikModelFromMap(String str) => GrafikModel.fromMap(json.decode(str));

String grafikModelToMap(GrafikModel data) => json.encode(data.toMap());

class GrafikModel {
  BefJam bef1jam;
  BefJam bef2jam;
  BefJam bef3jam;
  BefJam bef4jam;
  BefJam bef5jam;

  GrafikModel({
    required this.bef1jam,
    required this.bef2jam,
    required this.bef3jam,
    required this.bef4jam,
    required this.bef5jam,
  });

  factory GrafikModel.fromMap(Map<String, dynamic> json) => GrafikModel(
    bef1jam: BefJam.fromMap(json["bef_1jam"]),
    bef2jam: BefJam.fromMap(json["bef_2jam"]),
    bef3jam: BefJam.fromMap(json["bef_3jam"]),
    bef4jam: BefJam.fromMap(json["bef_4jam"]),
    bef5jam: BefJam.fromMap(json["bef_5jam"]),
  );

  Map<String, dynamic> toMap() => {
    "bef_1jam": bef1jam.toMap(),
    "bef_2jam": bef2jam.toMap(),
    "bef_3jam": bef3jam.toMap(),
    "bef_4jam": bef4jam.toMap(),
    "bef_5jam": bef5jam.toMap(),
  };
}

class BefJam {
  int avgIspupm25;
  int avgIspupm10;
  int avgIspuozon;
  int avgIspuco;

  BefJam({
    required this.avgIspupm25,
    required this.avgIspupm10,
    required this.avgIspuozon,
    required this.avgIspuco,
  });

  factory BefJam.fromMap(Map<String, dynamic> json) => BefJam(
    avgIspupm25: json["avg_ispupm25"],
    avgIspupm10: json["avg_ispupm10"],
    avgIspuozon: json["avg_ispuozon"],
    avgIspuco: json["avg_ispuco"],
  );

  Map<String, dynamic> toMap() => {
    "avg_ispupm25": avgIspupm25,
    "avg_ispupm10": avgIspupm10,
    "avg_ispuozon": avgIspuozon,
    "avg_ispuco": avgIspuco,
  };
}
