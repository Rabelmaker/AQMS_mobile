import 'package:aqms/provider/PageProvider.dart';
import 'package:aqms/ui/dashboard.dart';
import 'package:aqms/ui/list_stasiun.dart';
import 'package:aqms/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({super.key});

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageProvider>(
      builder: (context,data,_) {
        return Scaffold(
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(40)
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GNav(
                  rippleColor: const Color(0xff079450),
                  hoverColor: const Color(0xff079450),
                  gap: 8,
                  activeColor: Colors.white,
                  iconSize: 24,
                  selectedIndex: data.currentIndex,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  duration: const Duration(milliseconds: 400),
                  tabBackgroundColor: const Color(0xff079450),
                  color: Colors.white,
                  tabs:  [
                    GButton(
                      icon: LineIcons.home,
                      text: 'Dashboard',
                      onPressed: (){
                        data.setIndex(0);
                        data.controller.animateToPage(0, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                      },
                    ),
                    GButton(
                      icon: LineIcons.pieChart,
                      text: 'Grafik',
                      onPressed: (){
                        data.setIndex(1);
                        data.controller.animateToPage(1, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                      },
                    ),
                    GButton(
                      icon: LineIcons.user,
                      text: 'Profile',
                      onPressed: (){
                        data.setIndex(2);
                        data.controller.animateToPage(2, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: PageView(
            controller: data.controller,
            onPageChanged: (int i){
              data.setIndex(i);
            },
            children: const [
              Dashboard(),
              ListStasiun(),
              Profile()
            ],
          ),
        );
      }
    );
  }
}
