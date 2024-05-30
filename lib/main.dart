import 'package:flutter/material.dart';
import 'package:vintageapp/onboarding/login_page_materialapp.dart';
import 'onboarding/sign_up_page.dart';
import 'onboarding/splash_screen.dart';
import 'doctor_panel/doctor_details.dart';
import 'doctor_panel/doctor_panel.dart';

//Sope why

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0, // Remove shadow
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Home Page')),
    DoctorsList(),
    Center(child: Text('Results Page')),
    Center(child: Text('Profile Page')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        title: const Text('All Doctors'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/home.png',
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/appointment.png',
              width: 24,
              height: 24,
            ),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/results.png',
              width: 24,
              height: 24,
            ),
            label: 'Results',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/profile.png',
              width: 24,
              height: 24,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black, // Ensure selected item is visible
        unselectedItemColor: Colors.grey, // Ensure unselected items are visible
        onTap: _onItemTapped,
      ),
    );
  }
}

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        DoctorPanel(
          doctorName: 'Dr. David Patel',
          specialization: 'Cardiologist',
          location: 'Cardiology Center, USA',
          email: 'doctor@gmail.com',
          imagePath: 'assets/doc_tor.png',
        ),
        DoctorPanel(
          doctorName: 'Dr. Jessica Turner',
          specialization: 'Gynecologist',
          location: "Women's Clinic, Seatle, USA",
          email: 'doctor@gmail.com',
          imagePath: 'assets/doctor.png',
        ),
        DoctorPanel(
          doctorName: "Dr. Michael Johnson",
          specialization: "Orthopedic Surgery",
          location: "Maple Associates, NY, USA",
          email: "doctor@gmail.com",
          imagePath: 'assets/thir_d.png',
        ),
        DoctorPanel(
          doctorName: "Dr. Emily Walker",
          specialization: "Pediatrics",
          location: "Serenity Pediatrics Clinic",
          email: "doctor@gmail.com",
          imagePath: 'assets/fourt_h.png',
        ),
        DoctorPanel(
          doctorName: "Dr. Kim Smith",
          specialization: "Neurologist",
          location: "Stark TechGarden",
          email: "doctor@gmail.com",
          imagePath: 'assets/fift_h.png',
        ),
      ],
    );
  }
}
