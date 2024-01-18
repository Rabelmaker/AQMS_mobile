import 'package:aqms/model/grafik_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class GrafikProvider with ChangeNotifier {
  GrafikModel _grafikModel = GrafikModel(
    bef1jam: BefJam(
      avgIspupm25: 0,
      avgIspupm10: 0,
      avgIspuozon: 0,
      avgIspuco: 0,
    ),
    bef2jam: BefJam(
      avgIspupm25: 0,
      avgIspupm10: 0,
      avgIspuozon: 0,
      avgIspuco: 0,
    ),
    bef3jam: BefJam(
      avgIspupm25: 0,
      avgIspupm10: 0,
      avgIspuozon: 0,
      avgIspuco: 0,
    ),
    bef4jam: BefJam(
      avgIspupm25: 0,
      avgIspupm10: 0,
      avgIspuozon: 0,
      avgIspuco: 0,
    ),
    bef5jam: BefJam(
      avgIspupm25: 0,
      avgIspupm10: 0,
      avgIspuozon: 0,
      avgIspuco: 0,
    ),
  );

  GrafikModel get grafikModel => _grafikModel;

  Future<void> getGrafik() async {
    String endpoint = "https://breezomenter.annora.id/api/v1";
    final dio = Dio();
    Response response = await dio.get('$endpoint/grafik');
    print(response.data);
    _grafikModel = GrafikModel.fromMap(response.data["data"]);
    notifyListeners();
  }
}
