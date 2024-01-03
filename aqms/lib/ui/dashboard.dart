

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    Color greenman =  Color(0xff079450);
    Color sedang =  Color(0xff033E75);
    Color sedangoutlined =  Color(0xffAFD8FF);
    Color baik =  Color(0xff006D18);
    Color baikoutlined =  Color(0xff00C72C);
    Color tsehat =  Color(0xffECB800);
    Color tsehatoutlined =  Color(0xffFFE68B);
    Color stsehat =  Color(0xffEC0000);
    Color stsehatoutlined =  Color(0xffFF5B5B);
    Color berbahaya =  Color(0xff262626);
    Color berbahayaoutlined =  Color(0xff4E4C4C);
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Stack(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                            greenman.withOpacity(1),
                            baikoutlined.withOpacity(0.6),
                            // Colors.transparent,
                          ])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hi Akbar Maulana",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "Cek kualitas udara mu hari ini",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: AssetImage("assets/avatar.png"),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                height: 200,
                                decoration: BoxDecoration(
                                    color: greenman,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black45,
                                        offset: Offset(
                                          1.0,
                                          8.0,
                                        ),
                                        blurRadius: 8.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12, horizontal: 16),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                          height: 24,
                                          child:
                                              Image.asset("assets/termostat.png")),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text(
                                        "36°C",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(
                                        width: 24,
                                      ),
                                      SizedBox(
                                          height: 24,
                                          child:
                                              Image.asset("assets/kelembaban.png")),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      const Text(
                                        "60 %",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(
                                          1.0,
                                          10.0,
                                        ),
                                        blurRadius: 8.0,
                                        spreadRadius: 0.0,
                                      ),
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 17, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 24,
                                                child: Image.asset(
                                                    "assets/marker.png"),
                                              ),
                                              const SizedBox(
                                                width: 5,
                                              ),
                                              const Text(
                                                "Pekanbaru Kota",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 16),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Text(
                                            "Sedang",
                                            style: TextStyle(
                                                fontSize: 40,
                                                fontWeight: FontWeight.bold,
                                                color: sedang),
                                          )
                                        ],
                                      ),
                                      Container(
                                        height: 110,
                                        width: 110,
                                        decoration: BoxDecoration(
                                            color: sedang,
                                            border: Border.all(
                                                color: sedangoutlined, width: 6),
                                            borderRadius:
                                                BorderRadius.circular(60)),
                                        child: const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "1000",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 30,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              "AQI",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    width: double.infinity,
                    height: 180,
                    decoration: const BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: Offset(
                          1.0,
                          10.0,
                        ),
                        blurRadius: 8.0,
                        spreadRadius: 0.0,
                      ),
                    ]),
                    child: Row(
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: sedang,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20))),
                          ),
                        ),
                        Flexible(
                          flex: 7,
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: const Padding(
                              padding: EdgeInsets.all(20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tingkat kualitas udara masih dapat diterima pada kesehatan manusia hewan dan tumbuhan",

                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Divider(
                                    thickness: 2,
                                  ),
                                  Text(
                                    "Kelompok  sensitif : Kurangi  aktivitas  fisik  yang terlalu lama atau berat. Setiap orang : Masih  dapat beraktivitas  di luar ",
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Konsentrasi Parameter ISPU",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),),
                ),
                _parameter(sedang, "PM10", "Sedang", "15,5", "51"),
                _parameter(baik, "PM2.5", "Baik", "15,5", "51"),
                _parameter(tsehat, "Ozon", "Baik", "15,5", "51"),
                _parameter(stsehat, "VOC", "Baik", "15,5", "51"),
                SizedBox(
                  height: 100,
                )
              ],
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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 70,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff262626),
                      borderRadius: BorderRadius.circular(45)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const GNav(
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
            ),
          ],
        ),
      ),
    );
  }
}

Widget _parameter(
    Color warna, String parameter, String kualitas, String value, String aqi) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    child: Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
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
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 4,
              child: Text(
                parameter,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 5,
              child: Text(
                kualitas,
                textAlign: TextAlign.center,
                maxLines: 3,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16, color: warna),
              ),
            ),
            Flexible(
              flex: 6,
              child: Row(
                children: [
                  Flexible(
                    flex : 1,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            value,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const Text("µg/m³")
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: warna,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            aqi,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            "AQI",
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
