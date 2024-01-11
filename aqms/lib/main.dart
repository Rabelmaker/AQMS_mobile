
import 'package:aqms/provider/alat_provider.dart';
import 'package:aqms/provider/auth_provider/login_provider.dart';
import 'package:aqms/provider/auth_provider/registrasi_provider.dart';
import 'package:aqms/provider/dashboard_alat_provider.dart';
import 'package:aqms/provider/parameter_provider.dart';
import 'package:aqms/ui/auth/login.dart';
import 'package:aqms/ui/auth/register.dart';
import 'package:aqms/ui/dashboard.dart';
import 'package:aqms/ui/grafik.dart';
import 'package:aqms/ui/intro.dart';
import 'package:aqms/ui/list_stasiun.dart';
import 'package:aqms/ui/profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';


void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Intro();
      },
    ),
    GoRoute(
      path: '/register',
      name: 'register',
      builder: (BuildContext context, GoRouterState state) {
        return const Register();
      },
    ),
    GoRoute(
      path: '/login',
      name: "login",
      builder: (BuildContext context, GoRouterState state) {
        return const Login();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'dashboard',
          name: 'dashboard',
          builder: (BuildContext context, GoRouterState state) {
            return const Dashboard();
          },
        ),
        GoRoute(
          path: 'station',
          name: 'station',
          builder: (BuildContext context, GoRouterState state) {
            return const ListStasiun();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'grafik',
              name: 'grafik',
              builder: (BuildContext context, GoRouterState state) {
                return const Grafik();
              },

            ),
          ],
        ),
        GoRoute(
          path: 'profile',
          name: 'profile',
          builder: (BuildContext context, GoRouterState state) {
            return const Profile();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AlatProvider()),
        ChangeNotifierProvider(create: (_) => ParameterProvider()),
        ChangeNotifierProvider(create: (_) => DashboardAlatProvider()),
        ChangeNotifierProvider(create: (_) => RegistrasiProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
      ],
      child: MaterialApp.router(
        title: 'AQMS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}

