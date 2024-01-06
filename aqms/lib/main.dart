import 'package:aqms/auth/login.dart';
import 'package:aqms/provider/alat_provider.dart';
import 'package:aqms/ui/dashboard.dart';
import 'package:aqms/ui/intro.dart';
import 'package:aqms/ui/list_stasiun.dart';
import 'package:aqms/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth/register.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AlatProvider())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Dashboard()
      ),
    );
  }
}

