import 'package:flutter/material.dart';

class BadmintonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Badminton',
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
                'Badminton',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Basic Rules:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Scoring System:\n'
                '1. Matches are played in a best-of-3 games format.\n'
                '2. Each game goes up to 21 points, and a player/team must win by 2 points if the score reaches 20-20.\n'
                '3. If the score reaches 29-29, the first to 30 points wins the game.\n'
                '4. Rally scoring: A point is awarded after every rally, regardless of who served.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Singles vs. Doubles:\n'
                '1. Singles: One player per side.\n'
                '2. Doubles: Two players per side.\n'
                '3. Court boundaries differ slightly for singles and doubles.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Serving Rules:\n'
                '1. The serve must be hit below the waist.\n'
                '2. The server stands in the right service court if their score is even and left if odd.\n'
                '3. In doubles, the serving team switches sides after winning a point, but the receiving team does not.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Rally Play:\n'
                '1. A rally continues until the shuttle touches the ground, goes out of bounds, or a fault occurs.\n'
                '2. Players cannot hit the shuttle twice in succession.\n'
                '3. The shuttle must not touch the net on the serve but can touch it during rallies.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Faults and Violations:\n'
                '1. Out of bounds: If the shuttle lands outside the court lines.\n'
                '2. Net touch: Players must not touch the net with their body or racket.\n'
                '3. Foot fault: Feet must stay inside the service court while serving.\n'
                '4. Double hit: The shuttle cannot be hit twice consecutively by the same player.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Essential Badminton Equipment:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Badminton Racket:\n'
                '1. Lightweight (80-100 grams), typically made of carbon fiber or aluminum.\n'
                '2. Grip size and string tension vary depending on player preference.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Shuttlecock (Birdie):\n'
                '1. Made of feathers (professional) or nylon (recreational).\n'
                '2. Standard weight: 4.74 to 5.50 grams.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Badminton Court:\n'
                '1. Dimensions: 13.4 m long x 6.1 m wide for doubles and 5.18 m wide for singles.\n'
                '2. Net height: 1.55 meters at the sides and 1.524 meters in the center.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Player Gear:\n'
                '1. Comfortable sportswear, non-marking court shoes, and a towel for sweat.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Other Equipment:\n'
                '1. Net and poles to divide the court.\n'
                '2. Scoreboard for official matches.\n',
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
