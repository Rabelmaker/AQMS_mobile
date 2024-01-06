import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/alat_model.dart';

class AlatProvider with ChangeNotifier{
  List<AlatModel> _list = [];
  List<AlatModel> get list => _list;

  Future<void> getAlat() async {
    final dio = Dio();
    Response response = await dio.get('http://127.0.0.1:8000/api/v1/alat');
    print(response.data);
    _list = response.data.map((e)=>AlatModel.fromMap(e)).toList();
    notifyListeners();
  }

 }