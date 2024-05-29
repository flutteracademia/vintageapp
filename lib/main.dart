

import 'package:flutter/material.dart';
import 'package:vintageapp/login_page_materialapp.dart';
import 'sign_up_page.dart';
import 'splash_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
//This is a commit or a push you can say
      home: const SplashScreen(),
       routes: {
        '/main': (context) => const  TourPage(), // Define the route for the main page
      },
    );
  }
}