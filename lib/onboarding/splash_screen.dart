import 'package:flutter/material.dart';
// Make sure to create and import your main page

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigate to the main page after 3 seconds
    Future.delayed(Duration(seconds: 12), () {
      Navigator.pushReplacementNamed(context, '/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/Splash.png',
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
