import 'package:aqms/ui/components/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Tambahkan import ini
import '../provider/grafik_provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Grafik extends StatefulWidget {
  Grafik({Key? key}) : super(key: key);

  @override
  GrafikState createState() => GrafikState();
}

class GrafikState extends State<Grafik> {
  GrafikProvider grafikProvider = GrafikProvider();

  @override
  void initState() {
    super.initState();
    grafikProvider.getGrafik();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => grafikProvider,
      child: Scaffold(
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
                      SfCartesianChart(
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
                              _ParameterDataJam('PM10', grafikProvider.grafikModel.bef1jam.avgIspupm10.toDouble()),
                              _ParameterDataJam('PM2.5', grafikProvider.grafikModel.bef1jam.avgIspupm25.toDouble()),
                              _ParameterDataJam('Ozon', grafikProvider.grafikModel.bef1jam.avgIspuozon.toDouble()),
                              _ParameterDataJam('CO', grafikProvider.grafikModel.bef1jam.avgIspuco.toDouble()),
                            ],
                            xValueMapper: (_ParameterDataJam data, _) => data.jam,
                            yValueMapper: (_ParameterDataJam data, _) => data.parameter,
                            name: 'Data',
                            dataLabelSettings: const DataLabelSettings(isVisible: true),
                          ),
                          ColumnSeries<_ParameterDataJam, String>(
                            dataSource: [
                              _ParameterDataJam('PM10', grafikProvider.grafikModel.bef2jam.avgIspupm10.toDouble()),
                              _ParameterDataJam('PM2.5', grafikProvider.grafikModel.bef2jam.avgIspupm25.toDouble()),
                              _ParameterDataJam('Ozon', grafikProvider.grafikModel.bef2jam.avgIspuozon.toDouble()),
                              _ParameterDataJam('CO', grafikProvider.grafikModel.bef2jam.avgIspuco.toDouble()),
                            ],
                            xValueMapper: (_ParameterDataJam data, _) => data.jam,
                            yValueMapper: (_ParameterDataJam data, _) => data.parameter,
                            name: 'Data',
                            dataLabelSettings: const DataLabelSettings(isVisible: true),
                          ),
                          ColumnSeries<_ParameterDataJam, String>(
                            dataSource: [
                              _ParameterDataJam('PM10', grafikProvider.grafikModel.bef3jam.avgIspupm10.toDouble()),
                              _ParameterDataJam('PM2.5', grafikProvider.grafikModel.bef3jam.avgIspupm25.toDouble()),
                              _ParameterDataJam('Ozon', grafikProvider.grafikModel.bef3jam.avgIspuozon.toDouble()),
                              _ParameterDataJam('CO', grafikProvider.grafikModel.bef3jam.avgIspuco.toDouble()),
                            ],
                            xValueMapper: (_ParameterDataJam data, _) => data.jam,
                            yValueMapper: (_ParameterDataJam data, _) => data.parameter,
                            name: 'Data',
                            dataLabelSettings: const DataLabelSettings(isVisible: true),
                          ),
                          ColumnSeries<_ParameterDataJam, String>(
                            dataSource: [
                              _ParameterDataJam('PM10', grafikProvider.grafikModel.bef4jam.avgIspupm10.toDouble()),
                              _ParameterDataJam('PM2.5', grafikProvider.grafikModel.bef4jam.avgIspupm25.toDouble()),
                              _ParameterDataJam('Ozon', grafikProvider.grafikModel.bef4jam.avgIspuozon.toDouble()),
                              _ParameterDataJam('CO', grafikProvider.grafikModel.bef4jam.avgIspuco.toDouble()),
                            ],
                            xValueMapper: (_ParameterDataJam data, _) => data.jam,
                            yValueMapper: (_ParameterDataJam data, _) => data.parameter,
                            name: 'Data',
                            dataLabelSettings: const DataLabelSettings(isVisible: true),
                          ),
                          ColumnSeries<_ParameterDataJam, String>(
                            dataSource: [
                              _ParameterDataJam('PM10', grafikProvider.grafikModel.bef5jam.avgIspupm10.toDouble()),
                              _ParameterDataJam('PM2.5', grafikProvider.grafikModel.bef5jam.avgIspupm25.toDouble()),
                              _ParameterDataJam('Ozon', grafikProvider.grafikModel.bef5jam.avgIspuozon.toDouble()),
                              _ParameterDataJam('CO', grafikProvider.grafikModel.bef5jam.avgIspuco.toDouble()),
                            ],
                            xValueMapper: (_ParameterDataJam data, _) => data.jam,
                            yValueMapper: (_ParameterDataJam data, _) => data.parameter,
                            name: 'Data',
                            dataLabelSettings: const DataLabelSettings(isVisible: true),
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
