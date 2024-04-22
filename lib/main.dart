import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/firebase_options.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/select_mode_of_payment.dart';
import 'package:food_delivery_app/splash/splash_screen.dart';
import 'package:food_delivery_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(providers: [

      //theme provider
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),

      //restaurant provider
      ChangeNotifierProvider(
        create: (context) => Restaurant(),
      ),
    ],
child: const MyFoodDeliveryApp(),
    ),
  );
}

class MyFoodDeliveryApp extends StatelessWidget {
  const MyFoodDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
