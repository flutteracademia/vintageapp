import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


class ProfileCard extends StatelessWidget {
  final String name;
  final String title;
  final String description;
  final String imageUrl;

  const ProfileCard({super.key, 
    required this.name,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      height: 180,
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(25,10,0,0),
              child: CircleAvatar(
                radius: 40,
              backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.fromLTRB(4,0,0,0),
              child: Text(
                name,
                textAlign: TextAlign.start,
                style:  GoogleFonts.inter(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.blueGrey.shade900
                ),
              ),
            ),
            const SizedBox(height: 2),
            Padding(
              padding: const EdgeInsets.fromLTRB(4,0,0,0),
              child: Text(
                title,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ),
             const SizedBox(height: 12),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(4,0,6,0),
                  child: SvgPicture.asset("assets/Group 14.svg",
                  width: 10,
                  height:10,
                  ),
                ),
               Icon(Icons.location_on,
               color: Colors.grey,
               size: 15),
                SizedBox(width: 2,),
                Text('800m away',
                style: GoogleFonts.inter(
                  fontSize: 10.5,
                  color: Colors.grey,
                ),)
              ],
            )
          ],
        ),
      ),
    );
  }
}