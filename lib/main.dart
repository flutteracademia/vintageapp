import 'package:flutter/material.dart';
import 'package:vintageapp/Homepage/Homepage.dart';
import 'package:vintageapp/onboarding/login_page_materialapp.dart';
import 'onboarding/sign_up_page.dart';
import 'onboarding/splash_screen.dart';
import 'Widgets/profile_card_widget.dart';

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
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/main': (context) =>
            ProfileCard(
              name: 'Mosope Adegboyega' ,
              title: 'Software Engineer',
              description: 'Greatest Software Engineer',
              imageUrl: 'assets/doctors.png',
            ), // Define the route for the main page
      },
    );
  }
}
