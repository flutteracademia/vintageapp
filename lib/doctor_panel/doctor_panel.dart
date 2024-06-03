import 'package:flutter/material.dart';
import 'doctor_details.dart';

class DoctorPanel extends StatefulWidget {
  final String doctorName;
  final String specialization;
  final String location;
  final String email;
  final String imagePath;

  const DoctorPanel({
    required this.doctorName,
    required this.specialization,
    required this.location,
    required this.email,
    required this.imagePath,
    super.key,
  });

  @override
  _DoctorPanelState createState() => _DoctorPanelState();
}

class _DoctorPanelState extends State<DoctorPanel> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorDetails(
              doctorName: widget.doctorName,
              specialization: widget.specialization,
              location: widget.location,
              imagePath: widget.imagePath,
              about:
                  'Dr. David Patel, a dedicated cardiologist, brings a wealth of experience to Golden Gate Cardiology Center in Golden Gate, CA. view more',
              workingTime: 'Monday - Friday, 08:00AM - 18:00PM',
              patients: 2000,
              experience: 10,
              rating: 5.0,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 3,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.doctorName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        child: Image.asset(
                          'assets/heart.png',
                          color: isFavorite ? Colors.red : null,
                          width: 18,
                          height: 18,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    widget.specialization,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Image.asset(
                        'assets/location.png',
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          widget.location,
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        height: 10,
                        width: 1,
                        color: Colors.grey,
                      ),
                      Text(
                        widget.email,
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
