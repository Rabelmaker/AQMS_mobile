import 'package:aqms/model/alat_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';


class DashboardAlatProvider with ChangeNotifier {
  AlatModel _AlatModel = AlatModel(
    id: 0,
    code: "",
    alamat: "",
    lat: 0.0,
    lon: 0.0,
    createdAt: "",
    updatedAt: "",
  );

  AlatModel get alatModel => _AlatModel;

  Future<void> getDashboardAlat() async {
    String endpoint = "https://breezomenter.annora.id/api/v1";
    final dio = Dio();
    Response response = await dio.get('$endpoint/ispu');
    _AlatModel = AlatModel.fromMap(response.data["data"]);
    notifyListeners();
  }
}
