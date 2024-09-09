import 'package:e7sebly/core/routing/routes.dart';
import 'package:e7sebly/features/SplashScreen/presentation/view/SplashScreen.dart';
import 'package:e7sebly/features/azkar/presentation/view/azkar.dart';
import 'package:e7sebly/features/bmi/presentation/view/bmiScreen.dart';
import 'package:e7sebly/features/calculator/presentation/view/Calculator.dart';
import 'package:e7sebly/features/gpa/presentation/view/Gpa.dart';
import 'package:e7sebly/features/home/presentation/view/MainPage.dart';
import 'package:e7sebly/features/onboarding%20screen/presentation/view/onBoardingScreen.dart';
import 'package:e7sebly/features/qrcode/presentation/view/QrCode.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreens());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case Routes.qrCode:
        return MaterialPageRoute(builder: (_) => const Qrcode());
      case Routes.bmi:
        return MaterialPageRoute(builder: (_) => const BmiScreen());
      case Routes.azkar:
        return MaterialPageRoute(builder: (_) => const AzkarPage());
      case Routes.calculator:
        return MaterialPageRoute(builder: (_) => const Calculator());
        case Routes.gpa:
        return MaterialPageRoute(builder: (_) => const GPA());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
