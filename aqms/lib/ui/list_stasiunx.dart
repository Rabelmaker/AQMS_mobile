import 'package:aqms/model/alat_model.dart';
import 'package:aqms/provider/alat_provider.dart';
import 'package:aqms/ui/components/navbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListStasiun extends StatefulWidget {
  const ListStasiun({super.key});

  @override
  State<ListStasiun> createState() => _ListStasiunState();
}

class _ListStasiunState extends State<ListStasiun> {



  @override
  void initState() {
    context.read<AlatProvider>().getAlat();
    super.initState();
  }

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
                physics: const ScrollPhysics(),
                shrinkWrap: true,
                children: [
                  const Text(
                    "Wilayah Stasiun AQMS",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Consumer<AlatProvider>(

                    builder: (context, dataAlat, _) {
                      return ListView.builder(
                        physics: const ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: dataAlat.list.length,
                        itemBuilder: (BuildContext context, int index) {
                          return _itemStasiun(dataAlat.list[index]);
                        },);
                    }
                  ),


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

Widget _itemStasiun(AlatModel model) {
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

                    child: Image.asset("assets/map.png")),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  model.alamat,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "Online",
                  style: TextStyle(color: Colors.green),
                ),
                const SizedBox(
                  width: 16,
                ),
               SizedBox(
                 height: 16,
                   child: Image.asset("assets/signalfull.png"))
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
