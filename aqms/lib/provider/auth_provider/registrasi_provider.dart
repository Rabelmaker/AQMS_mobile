import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../model/auth_model/registrasi_model.dart';

class RegistrasiProvider with ChangeNotifier {
  RegistrasiModel _registrasiModel = RegistrasiModel(
    id: 0,
    username: '',
    nama: '',
    password: '',
  );

  RegistrasiModel get registrasiModel => _registrasiModel;

  Future<bool> registerUser() async {
    try {
      String endpoint = "https://breezomenter.annora.id/api/v1";
      final dio = Dio();
      Response response = await dio.post('$endpoint/registrasi', data: {
        'id': registrasiModel.id,
        'username': registrasiModel.username,
        'nama': registrasiModel.nama,
        'password': registrasiModel.password,
      });

      // You can handle the response here if needed
      print(response.data);

      // Notify listeners after successful registration
      notifyListeners();

      // Return true to indicate successful registration
      return true;
    } catch (error) {
      // Handle error, if any
      print('Error during registration: $error');

      // Return false to indicate registration failure
      return false;
    }
  }
}
