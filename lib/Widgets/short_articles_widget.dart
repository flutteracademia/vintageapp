import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class ArticleCard extends StatelessWidget {
  final String tag;
  final String title;
  final String thumbnail;
  final String date;
  final String minsRead;

  const ArticleCard({super.key, 
    required this.tag,
    required this.title,
    required this.thumbnail,
    required this.date,
    required this.minsRead
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180,
      height: 250,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              // By always putting <Widget I am telling dart that the list will only contain widgets
              child: Stack(children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(thumbnail,
                  width: 190 ,
                  height: 100,)
                  ),
                  const Positioned(
                    right: 3 ,
                    top: 3,
                    child: Icon(Icons.bookmark,
                    color: Colors.white,
                    size: 15,),
                  )
              ] 
              
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0,0,0,0),
              child: TextButton(onPressed: null, 
                          style: TextButton.styleFrom(
              backgroundColor: Colors.teal[100],
              minimumSize: const Size(5, 5)
                          ),
              
              child: Text(tag,
              style: GoogleFonts.inter(
                color: Colors.teal[700],
                fontSize: 9,
              ),
              )
              ),
            ),
            SizedBox(height: 6.5,),
            Padding(
              padding: const EdgeInsets.fromLTRB(4,0,0,0),
              child: SizedBox(
                width: 150,
                height: 70,
                child: Text(
                  title,
                  textAlign: TextAlign.start,
                  style:  GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.w900,
                    color: Colors.black
                  ),
                ),
              ),
            ),
            const SizedBox(height: 2),
            
             const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4,0,6,0),
                  child: Text(
                    date,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ),
              SizedBox(width: 3,),
                  Icon(Icons.circle,color: Colors.grey,
                  size: 5,),
                  SizedBox(width: 3,),
                   Text(
                    minsRead,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                   )
              ],
            )
          ],
        ),
      ),
    );
  }
}