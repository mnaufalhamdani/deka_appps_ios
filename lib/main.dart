// ignore_for_file: prefer_const_constructors

import 'package:deka_appps_ios/di/di.dart';
import 'package:deka_appps_ios/resource/theme.dart';
import 'package:deka_appps_ios/ui/dashboard/dashboard.dart';
import 'package:deka_appps_ios/ui/login/login.dart';
import 'package:deka_appps_ios/ui/login/register/register.dart';
import 'package:deka_appps_ios/ui/login/reset/reset_password.dart';
import 'package:deka_appps_ios/ui/rekap_izin/input/input_rekap_izin.dart';
import 'package:deka_appps_ios/ui/rekap_izin/rekap_izin.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dependencyInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      debugShowCheckedModeBanner: true,
      initialRoute: Login.nameRoute,
      routes: {
        Login.nameRoute: (context) => Login(),
        ResetPassword.nameRoute: (context) => ResetPassword(),
        Register.nameRoute: (context) => Register(),
        Dashboard.nameRoute: (context) => Dashboard(),
        RekapIzin.nameRoute: (context) => RekapIzin(),
        InputRekapIzin.nameRoute: (context) => InputRekapIzin(),
      },
    );
  }
}