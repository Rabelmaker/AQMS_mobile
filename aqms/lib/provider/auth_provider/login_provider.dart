import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../model/auth_model/login_model.dart';

class LoginProvider with ChangeNotifier {
  LoginModel _loginModel = LoginModel(
    id: 0,
    username: '',
    nama: '',
    password: '',
    rememberToken: '',
    createdAt: '',
    updatedAt: '',
  );

  LoginModel get loginModel => _loginModel;

  Future<bool> loginUser() async {
    try {
      String endpoint = "https://breezomenter.annora.id/api/v1";
      final dio = Dio();
      Response response = await dio.post('$endpoint/login', data: {
        'username': loginModel.username,
        'password': loginModel.password,
      });

      // You can handle the response here if needed
      print(response.data);

      // Update _loginModel with response data
      _loginModel = LoginModel.fromMap(response.data['data']);

      // Notify listeners after successful login
      notifyListeners();

      // Return true to indicate successful login
      return true;
    } catch (error) {
      // Handle error, if any
      print('Error during login: $error');

      // Return false to indicate login failure
      return false;
    }
  }
}
