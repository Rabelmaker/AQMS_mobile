import 'package:flutter/material.dart';

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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              Text("Wilayah Stasiun AQMS",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
            ],
          ),
        ),
      ),
    );
  }
}
