import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../provider/auth_provider/registrasi_provider.dart';
import '../components/color.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late Image bg;
  late Image logo;

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password harus diisi';
    } else if (value.length < 6) {
      return 'Password minimal 6 karakter';
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
    bg = Image.asset("assets/bg3.jpg", fit: BoxFit.cover,);
    logo = Image.asset("assets/logo.png");
  }

  TextEditingController userController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void registerUser(BuildContext context) {
    final registrasiProvider =
    Provider.of<RegistrasiProvider>(context, listen: false);

    // Validasi input sebelum melakukan registrasi
    if (validatePassword(passwordController.text) != null ||
        namaController.text.isEmpty ||
        userController.text.isEmpty) {
      // Menampilkan pesan error jika ada input yang tidak valid
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Registrasi Gagal'),
            content: Text('Harap isi semua kolom dengan benar dan password harus lebih dari 6.'),
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
      return;
    }

    registrasiProvider.registrasiModel.nama = namaController.text;
    registrasiProvider.registrasiModel.username = userController.text;
    registrasiProvider.registrasiModel.password = passwordController.text;

    registrasiProvider.registerUser().then((isSuccess) {
      if (isSuccess) {
        // Tampilkan pesan sukses dan navigasi ke login
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registrasi Berhasil'),
              content: Text(
                  'Registrasi berhasil! Silahkan login untuk melanjutkan.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    context.goNamed('login');
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        // Tampilkan pesan error untuk kegagalan registrasi
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Registrasi Gagal'),
              content: Text(
                  'Terjadi kesalahan saat registrasi atau username sudah terdaftar. Silakan coba lagi.'),
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
  void didChangeDependencies() {
    precacheImage(bg.image, context);
    precacheImage(logo.image, context);
    super.didChangeDependencies();
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
                        bottomRight: Radius.circular(200)),
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
                                  icon: Icon(Icons.accessibility_new_rounded),
                                  hintText: "Nama"),
                              controller: namaController,
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
                            onPressed: () => registerUser(context),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  greenman),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                              ),
                            ),
                            child: const Text(
                              "Registrasi",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: RichText(
                            text: TextSpan(
                              text: "Sudah Punya Akun ? ",
                              style: const TextStyle(color: Colors.black),
                              children: [
                                TextSpan(
                                  text: "Login",
                                  style: TextStyle(
                                    color: greenman,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () => context.goNamed('login'),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
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
