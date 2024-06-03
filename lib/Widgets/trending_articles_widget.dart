import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class ArticleWidget extends StatelessWidget {
 
  final String title;
  final String date;
  final String imageUrl;
  final String minsRead;

  const ArticleWidget({super.key, 
  
    required this.title,
    required this.date,
    required this.imageUrl,
    required this.minsRead,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius:  BorderRadius.circular(10)
      ),
      width: double.infinity,
    height: 100,
    child:  Flex(
      direction: Axis.horizontal,
      children: <Widget>[
       ClipRRect(borderRadius:  BorderRadius.circular(5.0),
          child: Image.asset(imageUrl,
          width: 100,
          height: 100,),
        ),
        SizedBox(width: 4,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
           
           children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 250,
                    child: Text(title,
                    style: GoogleFonts.inter(
                       fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.blueGrey.shade900
                    ),),
                  ),
                  Icon(Icons.bookmark,
                  color: Colors.teal[900],)
                ],
              ),
              SizedBox(height: 4,),
              Row(
                children: [
                  Text(
                    date,
                    textAlign: TextAlign.start,
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey,
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
              ),
            ],
          ),
      ],
    )
    );
  }
}