import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/parameter_model.dart';

class ParameterProvider with ChangeNotifier{
ParameterModel _parameterModel = ParameterModel(
  id:  0,
  idAlat: 0,
  temp: 0,
  hum: 0,
  pm25:  0,
  pm10:  0,
  voc:  0,
  ozon:  0,
  ispupm10:  0,
  ispupm25:  0,
  ispuozon: 0,
  ispuvoc:  0,
  kualitas: "",
  createdAt: "",
  updatedAt:  "",
);
  ParameterModel get parameterModel => _parameterModel;

  Future<void> getParameter() async {
    String endpoint = "https://breezomenter.annora.id/api/v1";
    final dio = Dio();
    Response response = await dio.get('$endpoint/ispu');
_parameterModel = ParameterModel.fromMap(response.data["data"]);
    notifyListeners();
  }

}