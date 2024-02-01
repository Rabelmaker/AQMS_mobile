import 'dart:async';
import 'package:aqms/ui/components/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../provider/grafik_provider.dart';

class Grafik extends StatefulWidget {
  Grafik({Key? key}) : super(key: key);

  @override
  GrafikState createState() => GrafikState();
}

class GrafikState extends State<Grafik> {
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    context.read<GrafikProvider>().getGrafik();

    // Add a timer to reload data every 2 minutes
    _timer = Timer.periodic(Duration(minutes: 2), (timer) {
      context.read<GrafikProvider>().getGrafik();
    });
  }

  @override
  void dispose() {
    // Dispose of the timer to avoid memory leaks
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime date1 = now.subtract(Duration(hours: 1));
    DateTime date2 = now.subtract(Duration(hours: 2));
    DateTime date3 = now.subtract(Duration(hours: 3));
    DateTime date4 = now.subtract(Duration(hours: 4));
    DateTime date5 = now.subtract(Duration(hours: 5));
    int befjam1 = date1.hour;
    int befjam2 = date2.hour;
    int befjam3 = date3.hour;
    int befjam4 = date4.hour;
    int befjam5 = date5.hour;


    return Consumer<GrafikProvider>(
      builder: (context,data,_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: greenman,
            foregroundColor: Colors.white,
            title: const Text('Pekanbaru Kota'),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Grafik AQI",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  Card(
                    child: Column(
                      children: [
                        Consumer<GrafikProvider>(
                          builder: (context,data,_) {
                            return SfCartesianChart(
                              primaryXAxis: const CategoryAxis(),
                              title: const ChartTitle(text: 'Per Jam'),
                              legend: const Legend(isVisible: true),
                              onLegendTapped: (LegendTapArgs x) {
                                print(x.pointIndex);
                              },
                              tooltipBehavior: TooltipBehavior(enable: true),
                              series: <CartesianSeries<_ParameterDataJam, String>>[


                                ColumnSeries<_ParameterDataJam, String>(
                                  dataSource: [
                                    _ParameterDataJam('PM10', double.parse(data.bef1jam.avgIspupm10.toStringAsFixed(1))),
                                    _ParameterDataJam('PM2.5', double.parse(data.bef1jam.avgIspupm25.toStringAsFixed(1))),
                                    _ParameterDataJam('Ozon', double.parse(data.bef1jam.avgIspuozon.toStringAsFixed(1))),
                                    _ParameterDataJam('CO', double.parse(data.bef1jam.avgIspuco.toStringAsFixed(1))),
                                  ],
                                  xValueMapper: (_ParameterDataJam data, _) => data.jam,
                                  yValueMapper: (_ParameterDataJam data, _) => data.parameter,
                                  name: "$befjam1:00",
                                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                                ),

                                ColumnSeries<_ParameterDataJam, String>(
                                  dataSource: [
                                    _ParameterDataJam('PM10',double.parse(data.bef2jam.avgIspupm10.toStringAsFixed(1))),
                                    _ParameterDataJam('PM2.5', double.parse(data.bef2jam.avgIspupm25.toStringAsFixed(1))),
                                    _ParameterDataJam('Ozon', double.parse(data.bef2jam.avgIspuozon.toStringAsFixed(1))),
                                    _ParameterDataJam('CO', double.parse(data.bef2jam.avgIspuco.toStringAsFixed(1))),
                                  ],
                                  xValueMapper: (_ParameterDataJam data, _) => data.jam,
                                  yValueMapper: (_ParameterDataJam data, _) => data.parameter,
                                  name: "$befjam2:00",
                                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                                ),
                                ColumnSeries<_ParameterDataJam, String>(
                                  dataSource: [
                                    _ParameterDataJam('PM10', double.parse(data.bef3jam.avgIspupm10.toStringAsFixed(1))),
                                    _ParameterDataJam('PM2.5',  double.parse(data.bef3jam.avgIspupm25.toStringAsFixed(1))),
                                    _ParameterDataJam('Ozon',  double.parse(data.bef3jam.avgIspuozon.toStringAsFixed(1))),
                                    _ParameterDataJam('CO',  double.parse(data.bef3jam.avgIspuco.toStringAsFixed(1))),
                                  ],
                                  xValueMapper: (_ParameterDataJam data, _) => data.jam,
                                  yValueMapper: (_ParameterDataJam data, _) => data.parameter,
                                  name: "$befjam3:00",
                                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                                ),
                                ColumnSeries<_ParameterDataJam, String>(
                                  dataSource: [
                                    _ParameterDataJam('PM10',  double.parse(data.bef4jam.avgIspupm10.toStringAsFixed(1))),
                                    _ParameterDataJam('PM2.5',double.parse(data.bef4jam.avgIspupm25.toStringAsFixed(1))),
                                    _ParameterDataJam('Ozon', double.parse(data.bef4jam.avgIspuozon.toStringAsFixed(1))),
                                    _ParameterDataJam('CO', double.parse(data.bef4jam.avgIspuco.toStringAsFixed(1))),
                                  ],
                                  xValueMapper: (_ParameterDataJam data, _) => data.jam,
                                  yValueMapper: (_ParameterDataJam data, _) => data.parameter,
                                  name: "$befjam4:00",
                                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                                ),
                                ColumnSeries<_ParameterDataJam, String>(
                                  dataSource: [
                                    _ParameterDataJam('PM10', double.parse(data.bef5jam.avgIspupm10.toStringAsFixed(1))),
                                    _ParameterDataJam('PM2.5',  double.parse(data.bef5jam.avgIspupm25.toStringAsFixed(1))),
                                    _ParameterDataJam('Ozon',  double.parse(data.bef5jam.avgIspuozon.toStringAsFixed(1))),
                                    _ParameterDataJam('CO',  double.parse(data.bef5jam.avgIspuco.toStringAsFixed(1))),
                                  ],
                                  xValueMapper: (_ParameterDataJam data, _) => data.jam,
                                  yValueMapper: (_ParameterDataJam data, _) => data.parameter,
                                  name: "$befjam5:00",
                                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                                ),
                              ],
                            );
                          }
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
    );
  }
}

class _ParameterDataJam {
  _ParameterDataJam(this.jam, this.parameter);

  final String jam;
  final double parameter;
}


class _ParameterDataHari {
  _ParameterDataHari(this.hari, this.parameter);

  final String hari;
  final double parameter;
}
