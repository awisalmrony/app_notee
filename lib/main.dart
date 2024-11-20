import 'package:app_note/view/screen/HomeView.dart';
import 'package:app_note/view/screen/splashview.dart';

import 'package:app_note/view/screen/loginpage.dart';
import 'package:app_note/view/screen/settingspage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashView(),
        '/home': (context) => const HomeView(),
        '/login': (context) => const LoginPage(),
        '/settings': (context) => const SettingsPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue, // يمكنك تخصيص الألوان هنا
      ),
    );
  }
}
