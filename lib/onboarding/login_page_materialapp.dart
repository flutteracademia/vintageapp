import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vintageapp/onboarding/forgot_password_page_one.dart';
import 'sign_up_page.dart';
import '../carousel.dart';
import 'package:google_fonts/google_fonts.dart';

// Define _currentPage as a global variable
int _currentPage = 0;



class TourPage extends StatefulWidget {
  const TourPage({super.key});

  @override
  _TourPageState createState() => _TourPageState();
}

class _TourPageState extends State<TourPage> {
  final PageController _pageController = PageController();

  final List<String> images = [
    'assets/doctor.png',
    'assets/doctors.png',
    'assets/nurse.png',
  ];

  final List<String> info = [
    'Elevate the quality of care with comprehensive patient profiles, real-time health monitoring, and personalized treatment plans.',
    'Connect and collaborate with a network of healthcare professionals to share insights, discuss cases, and streamline patient referrals.',
    'Leverage cutting-edge tools for diagnosis, treatment planning, and patient engagement to stay ahead in the rapidly evolving healthcare landscape.',
  ];

  final List<String> titles = [
    'Enhanced Patient Care',
    'Collaborative Healthcare Network',
    'Innovative Health Tools',
  ];
  final List<String> buttonText = [
    'Next',
    'Next',
    'Continue',
  ];

  // Method for switching pages when the next button is pressed
  void _nextPage() {
  if (_currentPage < images.length - 1) {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
    );
  } else {
    // Navigate to the second page using a Navigator
    //THis widget is use to switch the another dart file(Another Page I would say)
    Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondPageMaterialPage()));
  }
}

  Widget buildDot(int index) {
    bool isActive = index == _currentPage;
    return AnimatedContainer(
      duration: const  Duration(milliseconds: 300),
      margin: const  EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color.fromARGB(255, 5, 51, 88) : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: images.length,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Column(
            children: [
              Positioned.fill(
                child: Image.asset(
                  images[index],
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            titles[index],
                            style:  GoogleFonts.inter(
                               color: const Color.fromARGB(255, 26, 43, 51),
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          Text(
                            info[index],
                            style: GoogleFonts.inter(
                              color: const Color.fromARGB(255, 144, 144, 145),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _nextPage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 20, 26, 51),
                              foregroundColor: Colors.white,
                              minimumSize: const Size(1916.05, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child:  Text( buttonText[index],),
                          ),
                          const SizedBox(height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(images.length, (index) => buildDot(index)),
                          ),
                          // const SizedBox(height: 10),
                             Padding(
                             padding: const EdgeInsetsDirectional.only(top: 10),
                             child: RichText(
             text: TextSpan(
              children: [ TextSpan(
                    text: 'Skip',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w200,
                    ),
                    recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SecondPageMaterialPage()),
                      );
                    },
                    )
              ]
             ),
            ),
                           ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
