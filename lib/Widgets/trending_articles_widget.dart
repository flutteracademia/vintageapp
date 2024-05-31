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
    child: Flex(
      direction: Axis.horizontal,
      children: <Widget>[
        SvgPicture.asset(imageUrl,
        width: 70,
        height: 45,),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.start,
           
           children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 270,
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
              const SizedBox(height: 4,),
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
                  const Icon(Icons.circle,color: Colors.grey,
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