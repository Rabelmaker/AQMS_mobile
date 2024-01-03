import 'package:aqms/ui/components/navbar.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class ListStasiun extends StatefulWidget {
  const ListStasiun({super.key});

  @override
  State<ListStasiun> createState() => _ListStasiunState();
}

class _ListStasiunState extends State<ListStasiun> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ListView(
                children: [
                  const Text(
                    "Wilayah Stasiun AQMS",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  _itemStasiun("Pekanbaru Kota", Colors.green, "online" ,"signalfull.png","map.png"),
                  _itemStasiun("Jl.Cut Nyak Dien", Colors.red, "offline" ,"signallow.png","map.png")
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
                        ])
                ),
              ),
            ),
            customNavbar()
          ],
        ),
      ),
    );
  }
}

Widget _itemStasiun(String wilayah,Color warna,String status,String iconStatus,String iconMap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(
              1.0,
              5.0,
            ),
            blurRadius: 8.0,
            spreadRadius: 0.0,
          ),
        ],

      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 20,
                    child: Image.asset("assets/$iconMap")),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  wilayah,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  status,
                  style: TextStyle(color: warna),
                ),
                const SizedBox(
                  width: 16,
                ),
               SizedBox(
                 height: 16,
                   child: Image.asset("assets/$iconStatus"))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
