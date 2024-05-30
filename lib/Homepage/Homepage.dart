import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:carousel_slider/carousel_slider.dart';


// Define _currentPage as a global variable
int _currentPage = 0;



class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final PageController _pageController = PageController();

  final List<String> images = [
    'assets/carousel_image.png',
    'assets/carousel_image.png',
    'assets/carousel_image.png',

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
   
  }
}

  Widget buildDot(int index) {
    bool isActive = index == _currentPage;
    return AnimatedContainer(
      duration: const  Duration(milliseconds: 300),
      margin: const  EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 27 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ?  Colors.white : Colors.grey,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
     const border = OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey,
                  width: 2.0,
                  style:BorderStyle.solid,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              );
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _pageController,
        itemCount: 4,
        onPageChanged: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children:[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'Find your desired health solution',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ), 
                      ),
                      ),
                      const SizedBox(width: 50,),
                      const Icon(Icons.notifications_none,
                      size: 40,)
                  ],
                ),
                 const SizedBox(height: 10,),
                 Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: double.infinity,
              child: TextField(
                style: GoogleFonts.inter(
                 color: Colors.black
                ),
                decoration: InputDecoration(
                  hintText: 'Search doctor, drugs, articles...',
                  prefixIcon: const Icon(Icons.search_sharp),
                  prefixIconColor: Colors.grey,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  enabledBorder:  const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 2.0,
                    style:BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                ),
              ),
            ) 
            ),
               CarouselSlider(
                 options: CarouselOptions(height: 155.8),
                 items: images.map((imagePath) {
                   return Builder(
                     builder: (BuildContext context) {
                       return Container(
                         width: MediaQuery.of(context).size.width,
                         margin: const EdgeInsets.symmetric(horizontal: 5.0),
                         decoration: const BoxDecoration(
                           color: Colors.amber
                         ),
                         child: Stack(
                           children: [
                ClipRRect(
                      borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                        imagePath,
                        fit: BoxFit.cover,
                        height: 155.8,
                      ),
                            ),
                             Positioned(
                              left: 10,
                              top: 10,
                              child: SizedBox(
                                width: 120,
                                child: Text(
                                  'Looking for Specialist Doctors?',
                                  style: GoogleFonts.inter(
                                    fontSize: 19,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.white
                                  )
                                ),
                              ),
                            ),
                              Positioned(
                                bottom: 4,
                                left: 10,
                                right: 10,
                               child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: List.generate(images.length, (index) => buildDot(index)),
                              ),
                             ),
                           ],
                         ),
                       );
                     },
                   );
                 }).toList(),
               ),
               Container(
                child: Row(),
               )
              ]
            ),
          );
        },
      ),
    );
  }
}
