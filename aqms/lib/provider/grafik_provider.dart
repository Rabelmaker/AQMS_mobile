import 'package:aqms/model/grafik_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class GrafikProvider with ChangeNotifier {
  double _x = 0;

  GrafikModel _bef1jam = GrafikModel(
    avgIspupm25: 0,
    avgIspupm10: 0.0,
    avgIspuozon: 0,
    avgIspuco: 0,
  );
  GrafikModel _bef2jam = GrafikModel(
    avgIspupm25: 0,
    avgIspupm10: 0,
    avgIspuozon: 0,
    avgIspuco: 0,
  );
  GrafikModel _bef3jam = GrafikModel(
    avgIspupm25: 0,
    avgIspupm10: 0,
    avgIspuozon: 0,
    avgIspuco: 0,
  );
  GrafikModel _bef4jam = GrafikModel(
    avgIspupm25: 0,
    avgIspupm10: 0,
    avgIspuozon: 0,
    avgIspuco: 0,
  );
  GrafikModel _bef5jam = GrafikModel(
    avgIspupm25: 0,
    avgIspupm10: 0,
    avgIspuozon: 0,
    avgIspuco: 0,
  );

  GrafikModel get bef1jam => _bef1jam;
  GrafikModel get bef2jam => _bef2jam;
  GrafikModel get bef3jam => _bef3jam;
  GrafikModel get bef4jam => _bef4jam;
  GrafikModel get bef5jam => _bef5jam;
  double get x => _x;

  Future<void> getGrafik() async {
    String endpoint = "https://breezomenter.annora.id/api/v1";
    final dio = Dio();
    Response response = await dio.get('$endpoint/grafik');
    _bef1jam = GrafikModel.fromMap(response.data["data"]["bef_1jam"]);
    _bef2jam = GrafikModel.fromMap(response.data["data"]["bef_2jam"]);
    _bef3jam = GrafikModel.fromMap(response.data["data"]["bef_3jam"]);
    _bef4jam = GrafikModel.fromMap(response.data["data"]["bef_4jam"]);
    _bef5jam = GrafikModel.fromMap(response.data["data"]["bef_5jam"]);
    _x = 18.5;
    print("bef1jam : ${_bef1jam.avgIspupm10.toStringAsFixed(1)}");
    notifyListeners();
  }
}
