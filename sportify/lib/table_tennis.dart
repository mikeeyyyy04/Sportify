import 'package:flutter/material.dart';

class TableTennisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Table Tennis',
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
                'Table Tennis',
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
                '1. Team Composition: Table tennis can be played in singles (one player on each side) or doubles (two players on each side).\n'
                '2. Scoring:\n'
                '* Each game is played to 11 points.\n'
                '* A match usually consists of the best of 5 or 7 games.\n'
                '3. Service: The ball must be tossed at least 6 inches in the air and hit so it bounces on the server’s side and then the opponent’s side.\n'
                '4. Rally: Players alternately hit the ball until one fails to make a legal return.\n'
                '5. Faults: Points are awarded if the opponent fails to make a legal serve, fails to return the ball, or if the ball bounces twice on their side.\n'
                '6. The player or team who reaches the predetermined number of games first wins the match.',
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
                '1. Table tennis table\n'
                '2. Table tennis net\n'
                '3. Table tennis paddle\n'
                '4. Table tennis ball\n'
                '5. Sports shoes\n'
                '6. Uniforms (shirts and shorts)',
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
