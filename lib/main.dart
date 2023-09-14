// ignore_for_file: prefer_const_constructors

import 'package:deka_appps_ios/di/di.dart';
import 'package:deka_appps_ios/resource/theme.dart';
import 'package:deka_appps_ios/ui/dashboard/dashboard.dart';
import 'package:deka_appps_ios/ui/rekap_izin/rekap_izin_page.dart';
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
      debugShowCheckedModeBanner: false,
      initialRoute: Dashboard.nameRoute,
      routes: {
        Dashboard.nameRoute: (context) => Dashboard(),
        RekapIzin.nameRoute: (context) => RekapIzin(),
      },
    );
  }
}