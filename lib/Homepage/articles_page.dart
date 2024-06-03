import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import 'package:flutter_svg/flutter_svg.dart';
import "package:google_fonts/google_fonts.dart";
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vintageapp/Widgets/profile_card_widget.dart';
import 'package:flutter/gestures.dart';
import "package:vintageapp/Widgets/short_articles_widget.dart";
import "package:vintageapp/Widgets/trending_articles_widget.dart";

// Define _currentPage as a global variable
int _currentPage = 0;

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  _ArticlesPageState createState() => _ArticlesPageState();
}

class _ArticlesPageState extends State<ArticlesPage> {
  final List<String> images = [
    'assets/carousel_image.png',
    'assets/carousel_image.png',
    'assets/carousel_image.png',
  ];

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
      appBar: AppBar(
        title: const Center(child: Text('Articles')),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 18.0, 0, 18.0),
                child: TextField(
                  style: GoogleFonts.inter(color: Colors.black),
                  decoration: InputDecoration(
                    hintText: 'Search articles, news...',
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Popular',
                  style: GoogleFonts.inter(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 19
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.teal[800],
                      foregroundColor: Colors.white,
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text('Covid-19',
                    style: GoogleFonts.inter(
                        color: Colors.white
                      ),),
                  ),
                  TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.teal[800],
                      foregroundColor: Colors.white,
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Center(
                      child: Text('Diet',
                      style: GoogleFonts.inter(
                        color: Colors.white
                      ), ),
                    ),
                  ),
                  TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.teal[800],
                      foregroundColor: Colors.white,
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text('Fitness',
                    style: GoogleFonts.inter(
                        color: Colors.white
                      ),),
                  ),
                  TextButton(
                    onPressed: null,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.teal[800],
                      foregroundColor: Colors.white,
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text('Facts',
                    style: GoogleFonts.inter(
                        color: Colors.white
                      ),),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Trending Articles',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                         ArticleCard(tag: 'Covid-19', 
                         title: 'Comparing the AstraZeneca and Sinovac COVID-19 Vaccines'
                         , thumbnail: 'assets/Rectangle 460.png', 
                         date: 'June/1/2018', 
                         minsRead: '6 mins Read'),
                         ArticleCard(tag: 'Covid-19', 
                         title: 'Comparing the AstraZeneca and Sinovac COVID-19 Vaccines'
                         , thumbnail: 'assets/Rectangle 460.png', 
                         date: 'June/1/2018', 
                         minsRead: '6 mins Read'),
                         ArticleCard(tag: 'Covid-19', 
                         title: 'Comparing the AstraZeneca and Sinovac COVID-19 Vaccines'
                         , thumbnail: 'assets/Rectangle 460.png', 
                         date: 'June/1/2018', 
                         minsRead: '6 mins Read')
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Related Article',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 25.5,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  const ArticleWidget(
                    title:
                        'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
                    date: 'Jun 10, 2021 ',
                    imageUrl: 'assets/Mask group.png',
                    minsRead: '5 mins Read',
                  ),
                  const SizedBox(height: 5),
                  const ArticleWidget(
                    title:
                        'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
                    date: 'Jun 10, 2021 ',
                    imageUrl: 'assets/Mask group-1.png',
                    minsRead: '5 mins Read',
                  ),
                  const ArticleWidget(
                    title:
                        'The 25 Healthiest Fruits You Can Eat, According to a Nutritionist',
                    date: 'Jun 10, 2021 ',
                    imageUrl: 'assets/Mask group-2.png',
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
