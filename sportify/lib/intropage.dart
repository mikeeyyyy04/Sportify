// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, file_names

import 'package:flutter/material.dart';
import 'package:sportify/homescreen.dart';

class Intropage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/background.jpg'), // Add your sports image here
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Semi-transparent overlay
          Container(
            color: Color.fromARGB(255, 174, 229, 255).withOpacity(0.9),
          ),

          // Content
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Sportify logo
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Text(
                  'Sportify',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 0, 46, 145),
                  ),
                ),
              ),

              // Description Text
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Text(
                  "Got a piece of sports equipment but unsure what it’s for? Sportify is here to help.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
              ),

              // Centered Image
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: SizedBox(
                    width: 300, // Adjust the width as needed
                    height: 400, // Adjust the height as needed
                    child: Image.asset(
                        'assets/screen.png'), // Add your centered image here
                  ),
                ),
              ),

              // Spacer
              Expanded(child: Container()),

              // Scan button - made more prominent
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 18.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 153, 0),
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.qr_code_scanner,
                          size: 32,
                          color: Colors.white,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'TAP TO SCAN',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
