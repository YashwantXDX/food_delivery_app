import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/services/auth/auth_gate.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Spacer(),
        Center(
          child: LottieBuilder.asset(
            "assets/lottie/Animation - 1713598689640.json",
            height: MediaQuery.of(context).size.height / 3,
            repeat: true,
          ),
        ),
        Spacer(),
        Text("Developed By Yashwant Choure",style: TextStyle(color: Theme.of(context).colorScheme.secondary,fontWeight: FontWeight.bold),),
        Text("Student @ Mats University",style: TextStyle(color: Theme.of(context).colorScheme.secondary),),
      ],),
      nextScreen: const AuthGate(),
      backgroundColor: Colors.white,
      duration: 3000,
      splashIconSize: 1000,
    );
  }
}
