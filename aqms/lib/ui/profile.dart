import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'components/navbar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late GoRouter _router;

  @override
  Widget build(BuildContext context) {
    _router = GoRouter(routes: []);
    Color greenman = const Color(0xff079450);
    Color stsehat = const Color(0xffEC0000);
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  SizedBox(
                    height: 150,
                    child: Image.asset("assets/avatar.png"),
                  ),
                  SizedBox(
                    height: 24,
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: TextFormField(
                        maxLines: 1,
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.accessibility_new_rounded),
                            hintText: "Nama"),
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                      padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(greenman),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Updated",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ))),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      width: 650,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(stsehat),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ))),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.white.withOpacity(0.1),
                      Colors.white.withOpacity(1),
                      // Colors.transparent,
                    ])),
              ),
            ),
            customNavbar(context,_router)
          ],
        ),
      ),
    );
  }
}
