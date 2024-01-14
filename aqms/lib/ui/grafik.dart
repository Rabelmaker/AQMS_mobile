import 'package:aqms/ui/components/color.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Grafik extends StatefulWidget {
  Grafik({Key? key}) : super(key: key);

  @override
  GrafikState createState() => GrafikState();
}

class GrafikState extends State<Grafik> {
  List<_ParameterDataJam> pm10 = [
    _ParameterDataJam('12:00', 100),
    _ParameterDataJam('13:00', 150),
    _ParameterDataJam('14:00', 80),
    _ParameterDataJam('15:00', 85),
    _ParameterDataJam('16:00', 40),
  ];
  List<_ParameterDataJam> pm25 = [
    _ParameterDataJam('12:00', 15),
    _ParameterDataJam('13:00', 28),
    _ParameterDataJam('14:00', 34),
    _ParameterDataJam('15:00', 50),
    _ParameterDataJam('16:00', 40),
  ];
  List<_ParameterDataJam> ozon = [
    _ParameterDataJam('12:00', 100),
    _ParameterDataJam('13:00', 200),
    _ParameterDataJam('14:00', 300),
    _ParameterDataJam('15:00', 100),
    _ParameterDataJam('16:00', 150),
  ];
  List<_ParameterDataJam> voc = [
    _ParameterDataJam('12:00', 100),
    _ParameterDataJam('13:00', 80),
    _ParameterDataJam('14:00', 96),
    _ParameterDataJam('15:00', 77),
    _ParameterDataJam('16:00', 70),
  ];

  List<_ParameterDataHari> pm10d = [
    _ParameterDataHari('Sen', 35),
    _ParameterDataHari('Sel', 28),
    _ParameterDataHari('Rab', 34),
    _ParameterDataHari('Kam', 32),
    _ParameterDataHari('Jum', 40),
    _ParameterDataHari('Sab', 40),
    _ParameterDataHari('Min', 40),
  ];
  List<_ParameterDataHari> pm25d = [
    _ParameterDataHari('Jan', 35),
    _ParameterDataHari('Feb', 28),
    _ParameterDataHari('Mar', 34),
    _ParameterDataHari('Apr', 32),
    _ParameterDataHari('May', 40),
    _ParameterDataHari('Sab', 40),
    _ParameterDataHari('Min', 40),
  ];
  List<_ParameterDataHari> ozond = [
    _ParameterDataHari('Jan', 35),
    _ParameterDataHari('Feb', 28),
    _ParameterDataHari('Mar', 34),
    _ParameterDataHari('Apr', 32),
    _ParameterDataHari('May', 40),
    _ParameterDataHari('Sab', 40),
    _ParameterDataHari('Min', 40),
  ];
  List<_ParameterDataHari> vocd = [
    _ParameterDataHari('Jan', 35),
    _ParameterDataHari('Feb', 28),
    _ParameterDataHari('Mar', 34),
    _ParameterDataHari('Apr', 32),
    _ParameterDataHari('May', 40),
    _ParameterDataHari('Sab', 40),
    _ParameterDataHari('Min', 40),
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenman,
        foregroundColor: Colors.white,
        title: const Text('Jl.Garuda Sakti'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  "Grafik AQI",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Card(
                child: Column(
                  children: [
                    //Initialize the chart widget
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(text: 'Per Jam'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      onLegendTapped: (LegendTapArgs x){
                        print(x.pointIndex);
                      },
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <CartesianSeries<_ParameterDataJam, String>>[
                        ColumnSeries<_ParameterDataJam, String>(
                          dataSource: pm10,
                          xValueMapper: (_ParameterDataJam pm10, _) => pm10.jam,
                          yValueMapper: (_ParameterDataJam pm10, _) => pm10.parameter,
                          name: 'PM10',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true,),
                        ),
                        ColumnSeries<_ParameterDataJam, String>(
                          dataSource: pm25,
                          xValueMapper: (_ParameterDataJam pm25, _) => pm25.jam,
                          yValueMapper: (_ParameterDataJam pm25, _) => pm25.parameter,
                          name: 'PM2.5',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true,),
                        ),
                        ColumnSeries<_ParameterDataJam, String>(
                          dataSource: ozon,
                          xValueMapper: (_ParameterDataJam ozon, _) => ozon.jam,
                          yValueMapper: (_ParameterDataJam ozon, _) => ozon.parameter,
                          name: 'Ozon',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true,),
                        ),
                        ColumnSeries<_ParameterDataJam, String>(
                          dataSource: voc,
                          xValueMapper: (_ParameterDataJam voc, _) => voc.jam,
                          yValueMapper: (_ParameterDataJam voc, _) => voc.parameter,
                          name: 'VOC',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true,),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Card(
                child: Column(
                  children: [
                    //Initialize the chart widget
                    SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      // Chart title
                      title: ChartTitle(text: 'Per Hari'),
                      // Enable legend
                      legend: Legend(isVisible: true),
                      // Enable tooltip
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <CartesianSeries<_ParameterDataHari, String>>[
                        StackedBar100Series<_ParameterDataHari, String>(
                          dataSource: pm10d,
                          xValueMapper: (_ParameterDataHari pm10, _) => pm10.hari,
                          yValueMapper: (_ParameterDataHari pm10, _) => pm10.parameter,
                          name: 'PM 10',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                        ),
                        StackedBar100Series<_ParameterDataHari, String>(
                          dataSource: pm25d,
                          xValueMapper: (_ParameterDataHari pm25, _) => pm25.hari,
                          yValueMapper: (_ParameterDataHari pm25, _) => pm25.parameter,
                          name: 'PM 2.5',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                        ),
                        StackedBar100Series<_ParameterDataHari, String>(
                          dataSource: ozond,
                          xValueMapper: (_ParameterDataHari ozon, _) => ozon.hari,
                          yValueMapper: (_ParameterDataHari ozon, _) => ozon.parameter,
                          name: 'Ozon',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                        ),
                        StackedBar100Series<_ParameterDataHari, String>(
                          dataSource: vocd,
                          xValueMapper: (_ParameterDataHari voc, _) => voc.hari,
                          yValueMapper: (_ParameterDataHari voc, _) => voc.parameter,
                          name: 'VOC',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true),
                        ),
                      ],
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
