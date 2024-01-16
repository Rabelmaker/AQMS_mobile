import 'package:aqms/provider/dashboard_alat_provider.dart';
import 'package:aqms/provider/parameter_provider.dart';
import 'package:aqms/ui/components/color.dart';
import 'package:flutter/material.dart';


import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  void initState() {

    context.read<ParameterProvider>().getParameter();
    context.read<DashboardAlatProvider>().getDashboardAlat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffEEEEEE),
      body: SafeArea(
        child: Stack(
          children: [
            Consumer<ParameterProvider>(builder: (context, data, _) {
              Color warna;
              Color warnaOutlined;
              String keterangan;
              String penanganan;
              double tinggi = 0;
              String kualitas = data.parameterModel.kualitas;

              if (kualitas == "Baik") {
                warna = baik;
                tinggi = 200;
                warnaOutlined = baikoutlined;
                penanganan = "Sangat baik melakukan kegiatan di luar ";
                keterangan =
                    "Tingkat kualitas udara yang sangat baik, tidak memberikan efek negatif terhadap manusia, hewan, tumbuhan. ";
              } else if (kualitas == "Sedang") {
                warna = sedang;
                tinggi = 250;
                warnaOutlined = sedangoutlined;
                penanganan =
                    "Kelompok sensitif: Kurangi aktivitas fisik yang terlalu lama atau berat. Setiap orang: Masih dapat beraktivitas di luar  ";
                keterangan =
                    "Tingkat kualitas udara masih dapat diterima pada kesehatan manusia, hewan dan tumbuhan.  ";
              } else if (kualitas == "Tidak Sehat") {
                warna = tsehat;
                tinggi = 300;
                warnaOutlined = tsehatoutlined;
                penanganan =
                    "Kelompok sensitif: Boleh melakukan aktivitas di luar, tetapi mengambil rehat lebih sering dan melakukan aktivitas ringan. Amati gejala berupa batuk atau nafas sesak. Penderita asma harus mengikuti petunjuk kesehatan untuk asma dan menyimpan obat asma. Penderita penyakit jantung: gejala seperti palpitasi/jantung berdetak lebih cepat, sesak nafas, atau kelelahan yang tidak biasa mungkin mengindikasikan masalah serius. Setiap orang: Mengurangi aktivitas fisik yang terlalu lama di luar ruangan.  ";
                keterangan =
                    "Tingkat kualitas udara yang bersifat merugikan pada manusia, hewan dan tumbuhan.  ";
              } else if (kualitas == "Sangat Tidak Sehat") {
                warna = stsehat;
                tinggi = 290;
                warnaOutlined = stsehatoutlined;
                penanganan =
                "Kelompok sensitif: Hindari semua aktivitas di luar. Perbanyak aktivitas di dalam ruangan atau lakukan penjadwalan ulang pada waktu dengan kualitas udara yang baik. Setiap orang: Hindari  aktivitas  fisik  yang terlalu lama di luar ruangan, pertimbangkan untuk melakukan aktivitas di dalam ruangan.   ";
                keterangan =
                "Tingkat kualitas udara yang dapat meningkatkan resiko kesehatan pada sejumlah segmen  populasi  yang terpapar.  ";
              } else {
                warna = berbahaya;
                warnaOutlined = berbahayaoutlined;
                tinggi = 260;
                penanganan =
                "Kelompok sensitif: Tetap di dalam ruangan dan hanya melakukan sedikit aktivitas Setiap orang: Hindari semua aktivitas di luar";
                keterangan =
                "Tingkat kualitas udara yang dapat merugikan kesehatan serius pada populasi dan perlu penanganan cepat. ";
              }
              double temp = data.parameterModel.temp;
              double hum = data.parameterModel.hum;
              String humInStr = hum.toStringAsFixed(1);
              String tempInStr = temp.toStringAsFixed(1);
              return ListView(
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
                                  backgroundImage:
                                      AssetImage("assets/avatar.png"),
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                            height: 24,
                                            child: Image.asset(
                                                "assets/termostat.png")),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "$tempInStr °C",
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                        const SizedBox(
                                          width: 24,
                                        ),
                                        SizedBox(
                                            height: 24,
                                            child: Image.asset(
                                                "assets/kelembaban.png")),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Text(
                                          "$humInStr %",
                                          style: const TextStyle(
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
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
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
                                                  Text(
                                                    data.parameterModel.alamat,
                                                    maxLines: 1,
                                                    overflow: TextOverflow.fade,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 16),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 12,
                                              ),
                                              Text(
                                                data.parameterModel.kualitas,
                                                style: TextStyle(
                                                    fontSize: 21,
                                                    fontWeight: FontWeight.bold,
                                                    color: warna),
                                                maxLines: 2,
                                              )
                                            ],
                                          ),
                                          Container(
                                            height: 110,
                                            width: 110,
                                            decoration: BoxDecoration(
                                                color: warna,
                                                border: Border.all(
                                                    color: warnaOutlined,
                                                    width: 6),
                                                borderRadius:
                                                    BorderRadius.circular(60)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  [
                                                    data.parameterModel
                                                        .ispupm25,
                                                    data.parameterModel
                                                        .ispupm10,
                                                    data.parameterModel
                                                        .ispuozon,
                                                    data.parameterModel.ispuco
                                                  ].reduce((value, element) => value > element ? value : element).toStringAsFixed(1),
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 24,
                                                      color: Colors.white),
                                                ),
                                                const Text(
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
                                    )),
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
                      height: tinggi,
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
                                color: warna,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
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
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          keterangan,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Divider(
                                      thickness: 2,
                                    ),
                                    Expanded(
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          penanganan,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Konsentrasi Parameter ISPU",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  _parameter("PM10", data.parameterModel.pm10,
                      data.parameterModel.ispupm10),
                  _parameter("PM2.5", data.parameterModel.pm25,
                      data.parameterModel.ispupm25),
                  _parameter("Ozon", data.parameterModel.ozon,
                      data.parameterModel.ispuozon),
                  _parameter("CO", data.parameterModel.co,
                      data.parameterModel.ispuco),
                  const SizedBox(
                    height: 20,
                  )
                ],
              );
            }),
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
                      Colors.white.withOpacity(0.0),
                      Colors.white.withOpacity(1),
                      // Colors.transparent,
                    ])),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _parameter(String parameter, double value, double aqi) {
  Color warna;
  String kualitasAqi;

  if (aqi >= 0 && aqi <= 50) {
    warna = baik;
    kualitasAqi = "Baik";
  } else if (aqi > 50 && aqi <= 100) {
    warna = sedang;
    kualitasAqi = "Sedang";
  } else if (aqi > 100 && aqi <= 200) {
    warna = tsehat;
    kualitasAqi = "Tidak Sehat";
  } else if (aqi > 200 && aqi <= 300) {
    warna = stsehat;
    kualitasAqi = "Sangat Tidak Sehat";
  } else {
    warna = berbahaya;
    kualitasAqi = "Berbahaya";
  }
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
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Flexible(
              flex: 5,
              child: Text(
                kualitasAqi,
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
                    flex: 1,
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
                            value.toStringAsFixed(1),
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
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
                            aqi.toStringAsFixed(1),
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 18,
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
