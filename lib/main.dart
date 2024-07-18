import 'package:device_preview/device_preview.dart';
import 'package:e7sebly/features/SplashScreen/presentation/view/SplashScreen.dart';
import 'package:e7sebly/features/azkar/presentation/view/azkar.dart';
import 'package:e7sebly/features/bmi/presentation/view/bmiScreen.dart';
import 'package:e7sebly/features/calculator/presentation/view/Calculator.dart';
import 'package:e7sebly/features/gpa/presentation/view/Gpa.dart';
import 'package:e7sebly/features/qrcode/presentation/view/QrCode.dart';
import 'package:flutter/material.dart';
import 'features/home/presentation/view/MainPage.dart';

void main() {
  runApp(
    DevicePreview(builder: (context) => const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        "azkar": (context) => const Azkarpage(),
        "bmi": (context) => const BmiScreen(),
        "calc": (context) => const Calculator(),
        "gpa": (context) => const GPA(),
        "qrcode": (context) => const Qrcode(),
        "main": (context) => const HomePage(),
      },
    );
  }
}