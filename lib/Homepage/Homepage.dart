import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:google_fonts/google_fonts.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vintageapp/Widgets/profile_card_widget.dart';
import 'package:flutter/gestures.dart';
import "package:vintageapp/Widgets/trending_articles_widget.dart";

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
      // Do something when the last page is reached
    }
  }

  Widget buildDot(int index) {
    bool isActive = index == _currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isActive ? 27 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.grey,
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
        style: BorderStyle.solid,
      ),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    width: 170,
                    child: Text(
                      'Find your desired health solution',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 50,),
                  const Icon(Icons.notifications_none, size: 30,)
                ],
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 18.0, 0, 18.0),
                child: TextField(
                  style: GoogleFonts.inter(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Search doctor, drugs, articles...',
                    prefixIcon: const Icon(Icons.search_sharp),
                    prefixIconColor: Colors.grey,
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                  ),
                ),
              ),
              //This Carousel widgets allows you creat a horizontal list of scrollable images 
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  viewportFraction: 1.0,
                  enableInfiniteScroll: false,
                ),
                items: images.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: const BoxDecoration(
                          color: Colors.amber,
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.0),
                              child: Image.asset(
                                imagePath,
                                fit: BoxFit.cover,
                                height: 200.0,
                              ),
                            ),
                            Positioned(
                              left: 10,
                              top: 10,
                              child: SizedBox(
                                width: 200,
                                child: Text(
                                  'Looking for Specialist Doctors?',
                                  style: GoogleFonts.inter(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
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
              const SizedBox(height: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Top Doctors',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        SizedBox(
                          width: 140,
                          child: ProfileCard(
                            name: 'Dr. Marcus Horiz',
                            title: 'Cardiologist',
                            description: "I am him",
                            imageUrl: 'assets/Avatar.svg',
                          ),
                        ),
                        SizedBox(width: 8,),
                        SizedBox(
                          width: 140,
                          child: ProfileCard(
                            name: 'Dr Maria Elena',
                            title: 'Psychologist',
                            description: "I am him",
                            imageUrl: 'assets/Avatar-1.svg',
                          ),
                        ),
                        SizedBox(width: 8,),
                        SizedBox(
                          width: 140,
                          child: ProfileCard(
                            name: 'Dr. Stevi Jessi',
                            title: 'Orthopedist',
                            description: "I am him",
                            imageUrl: 'assets/Avatar-2.svg',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Health Article',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 25.5,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'See all',
                              style: GoogleFonts.inter(
                                color: Colors.teal[600],
                                fontSize: 16.5,
                                fontWeight: FontWeight.normal,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Homepage()),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5,),
                  const ArticleWidget(
                    title: 'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
                    date: 'Jun 10, 2021 ',
                    imageUrl: 'assets/Mask group.svg',
                    minsRead: '5 mins Read',
                  ),
                  const SizedBox(height: 5),
                  const ArticleWidget(
                    title: 'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
                    date: 'Jun 10, 2021 ',
                    imageUrl: 'assets/Mask group-1.svg',
                    minsRead: '5 mins Read',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
