import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/parameter_model.dart';

class ParameterProvider with ChangeNotifier{
  List<ParameterModel> _list = [];
  List<ParameterModel> get list => _list;

  Future<void> getParameter() async {
    final dio = Dio();
    Response response = await dio.get('http://127.0.0.1:8000/api/v1/parameter');
    print(response.data);
    _list = response.data.map((e)=>ParameterModel.fromMap(e)).toList();
    notifyListeners();
  }

}