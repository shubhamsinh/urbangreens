import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:urbangreens/pages/home/main_page.dart';
import 'package:urbangreens/pages/home/main_page.dart';
import 'package:urbangreens/pages/product/product.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:urbangreens/pages/signup-login/signin.dart';
import 'pages/home/page_body.dart';
import 'package:lottie/lottie.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Urban Greens',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: AnimatedSplashScreen(
        splash: Container(
          width: 250,
          child: Lottie.network(
              //tree
              'https://assets2.lottiefiles.com/packages/lf20_edpg3c3s.json',
              //seed tree
              // 'https://assets2.lottiefiles.com/packages/lf20_bx9t7qgt.json',
              fit: BoxFit.cover),
        ),

        // photoSize: 150,
        // seconds: 5,
        nextScreen: MainPage(),
        // splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        duration: 3000,
      ),
    );
  }
}
