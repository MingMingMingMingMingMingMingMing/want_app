import 'package:flutter/material.dart';
import 'package:want_front/pages/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Want',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF0099)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
