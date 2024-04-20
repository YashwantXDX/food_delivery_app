import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/services/auth/auth_gate.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Center(
          child: LottieBuilder.asset(
        "assets/lottie/Animation - 1713598689640.json",
      )),
      nextScreen: const AuthGate(),
      backgroundColor: Colors.white,
      duration: 5000,
      splashIconSize: 400,
    );
  }
}
