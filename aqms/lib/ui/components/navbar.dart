// navbar.dart

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

Widget customNavbar() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
            color: const Color(0xff262626),
            borderRadius: BorderRadius.circular(45)),
        child: const Padding(
          padding: EdgeInsets.all(8.0),
          child: GNav(
            rippleColor: Color(0xff079450),
            hoverColor: Color(0xff079450),
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: Duration(milliseconds: 400),
            tabBackgroundColor: Color(0xff079450),
            color: Colors.white,
            tabs: [
              GButton(
                icon: LineIcons.home,
                text: 'Dashboard',
              ),
              GButton(
                icon: LineIcons.pieChart,
                text: 'Grafik',
              ),
              GButton(
                icon: LineIcons.user,
                text: 'Profile',
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
