import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'book_appointment.dart';

class DoctorDetails extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String location;
  final String imagePath;
  final String about;
  final String workingTime;
  final int patients;
  final int experience;
  final double rating;

  const DoctorDetails({
    required this.doctorName,
    required this.specialization,
    required this.location,
    required this.imagePath,
    required this.about,
    required this.workingTime,
    required this.patients,
    required this.experience,
    required this.rating,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: Text('Doctor Details'),
            ),
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: () {
                  // Handle favorite logic here
                },
                child: Image.asset(
                  'assets/heart.png',
                  width: 25,
                  height: 25,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
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
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(imagePath),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                doctorName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              const Divider(thickness: 1, color: Colors.grey),
                              Text(
                                specialization,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Image.asset(
                                    'assets/location.png',
                                    width: 18,
                                    height: 18,
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    location,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
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
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Image.asset('assets/users.png',
                              width: 60, height: 60),
                          const SizedBox(height: 8),
                          Text(
                            '$patients+',
                            style: const TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold, 
                            ),
                          ),
                          const Text(
                            'patients',
                            style: TextStyle(
                              fontSize: 16, 
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/medal.png',
                              width: 60, height: 60),
                          const SizedBox(height: 8),
                          Text(
                            '$experience+',
                            style: const TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold, 
                            ),
                          ),
                          const Text(
                            'experience',
                            style: TextStyle(
                              fontSize: 16, 
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Image.asset('assets/star.png', width: 60, height: 60),
                          const SizedBox(height: 8),
                          Text(
                            '$rating',
                            style: const TextStyle(
                              fontSize: 20, 
                              fontWeight: FontWeight.bold, 
                            ),
                          ),
                          const Text(
                            'rating',
                            style: TextStyle(
                              fontSize: 16, 
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'About me',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  const SizedBox(height: 8),
                  RichText(
                    text: TextSpan(
                      text: about,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: [
                        TextSpan(
                          text: ' view more',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle view more logic here
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Working Time',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    workingTime,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Divider(thickness: 1, color: Colors.grey[300]),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const BookAppointment()),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 60),
                backgroundColor: const Color(0xFF1C2A3A), 
              ),
              child: const Text(
                'Book Appointment',
                style: TextStyle(
                  color: Colors.white, 
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
