import 'package:flutter/material.dart';

class BasketballScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Basketball',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor:
            Color.fromARGB(255, 41, 115, 178), // Set the app bar color here
      ),
      body: Container(
        color:
            Color.fromARGB(255, 255, 255, 255), // Set the background color here
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          // Add SingleChildScrollView to make it scrollable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Basketball',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Basic Rules of the Game:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 8),
              Text(
                '1. Team Composition: Each team has 5 players on the court (2 guards, 2 forwards, 1 center).\n'
                '2. Scoring:\n'
                '* Field goal inside the three-point line = 2 points\n'
                '* Field goal beyond the three-point line = 3 points\n'
                '* Free throw = 1 point\n'
                '3. Game Duration: The game consists of four quarters, each lasting 12 minutes (NBA) or 10 minutes (FIBA).\n'
                '4. Players can move the ball by dribbling or passing.\n'
                '5. Fouls are called for illegal physical contact or violations of the rules.\n'
                '6. Free throws are awarded for certain fouls, giving the fouled player an opportunity to score points unopposed.\n'
                '7. The team with the most points at the end of the game wins.',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Sports Equipment Needed:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 8),
              Text(
                '1. Basketball\n'
                '2. Basketball hoop and backboard\n'
                '3. Basketball court\n'
                '4. Basketball shoes\n'
                '5. Uniforms (jerseys and shorts)\n'
                '6. Shot clock and game clock',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
