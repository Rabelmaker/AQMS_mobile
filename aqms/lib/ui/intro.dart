import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    Color greenman = const Color(0xff079450);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                width: double.infinity,
                child: Image.asset(
                  "assets/bg4.png",
                  fit: BoxFit.cover,
                )),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 250,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.0),
                          Colors.black.withOpacity(1),
                          // Colors.transparent,
                        ])
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60,horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Welcome To Breezometer",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                  const Text(
                    "Aplikasi terpercaya anda untuk melihat informasi kualitas udara secara real time, ayo mulai perjalanan anda bersama kami untuk mendapatkan udara yang lebih sehat.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                      width: 650,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () => context.goNamed('login'),
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
                            "Get Started",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
