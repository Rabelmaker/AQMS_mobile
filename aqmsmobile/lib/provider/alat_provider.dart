import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/alat_model.dart';

class AlatProvider with ChangeNotifier{
  List<AlatModel> _list = [];
  List<AlatModel> get list => _list;

  Future<void> getAlat() async {
    String endpoint = "https://breezomenter.annora.id/api/v1";
    final dio = Dio();
    Response response = await dio.get("$endpoint/alat");
    print(response.data);
    _list = (response.data['data'] as List).map((e) => AlatModel.fromMap(e)).toList();
    notifyListeners();
  }

 }