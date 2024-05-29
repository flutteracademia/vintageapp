import 'package:vintageapp/login_page_materialapp.dart';
import 'sign_up_page.dart';
import 'splash_screen.dart';
import 'package:flutter/material.dart';

//Sope why

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashScreen(),
      routes: {
        '/main': (context) =>
            const TourPage(), // Define the route for the main page
      },
    );
  }
}
