import 'package:aqms/provider/auth_provider/login_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../components/color.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  late Image bg;
  late Image logo;

  @override
  void initState() {
    super.initState();
    bg = Image.asset("assets/bg2.jpg", fit: BoxFit.cover,);
    logo = Image.asset("assets/logo.png");
  }
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void loginUser(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context, listen: false);

    loginProvider.loginModel.username = userController.text;
    loginProvider.loginModel.password = passwordController.text;

    loginProvider.loginUser().then((isSuccess) {
      if (isSuccess) {
        // Tampilkan pesan sukses dan navigasi ke dashboard
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Berhasil'),
              content: Text('Selamat datang, ${loginProvider.loginModel.nama}!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.goNamed('dashboard');
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Tampilkan pesan error untuk kegagalan login
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Gagal'),
              content: Text('Username atau password salah. Silakan coba lagi.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Flexible(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(200)),
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: bg
                    ),
                  ),
                ),
                Flexible(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 16),
                      child: ListView(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: greenman,
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: TextFormField(
                                maxLines: 1,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(Icons.account_circle),
                                    hintText: "Username"),
                                controller: userController,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: greenman,
                                width: 3.0,
                              ),
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: TextFormField(
                                maxLines: 1,
                                obscureText: true,
                                enableSuggestions: false,
                                autocorrect: false,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    icon: Icon(Icons.lock),
                                    hintText: "Password"),
                                controller: passwordController,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          SizedBox(
                              width: 650,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () => loginUser(context),
                                  style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            greenman),
                                    shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(40.0),
                                      ),
                                    ),
                                  ),
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ))),
                          const SizedBox(
                            height: 16,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                text: "Belum Punya Akun ? ",
                                style: const TextStyle(color: Colors.black),
                                children: [
                                  TextSpan(
                                    text: "Registrasi",
                                    style: TextStyle(
                                      color: greenman,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => context.goNamed('register'),
                                  ),
                                ],
                              ),
                            ),

                          )
                        ],
                      ),
                    )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 280),
              child: Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    height: 100, child: logo),
              ),
            )
          ],
        ),
      ),
    );
  }
}
