import 'package:flutter/material.dart';

class VolleyballScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Volleyball',
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
                'Volleyball',
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
                'Team Composition:\n'
                '1. Each team has 6 players on the court.\n'
                '2. There are 3 front-row and 3 back-row players.\n'
                '3. A libero (defensive specialist) wears a different jersey and cannot attack or serve.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Game Structure:\n'
                '1. A match is played in a best-of-5 sets format.\n'
                '2. Each set is played to 25 points (except the 5th set, which goes to 15 points).\n'
                '3. A team must win by at least 2 points.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Scoring:\n'
                '1. Rally scoring: A point is scored on every rally, regardless of which team served.\n'
                '2. A team wins a point if the ball hits the opponent\'s court, the opponent makes an error, or the opponent commits a violation.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Serving:\n'
                '1. The server must stand behind the end line while serving.\n'
                '2. The serve can be overhand or underhand.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Ball Contacts:\n'
                '1. Each team has a maximum of 3 touches before sending the ball over the net.\n'
                '2. Common touches are the bump (pass), set, and spike.\n'
                '3. A player cannot hit the ball twice in a row, except after a block.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Violations:\n'
                '1. Net Touch: A player cannot touch the net during play.\n'
                '2. Lift or Carry: The ball must not be caught or thrown.\n'
                '3. Foot Fault: Stepping over the service line while serving.\n'
                '4. Back-Row Attack: Back-row players can’t spike from in front of the attack line.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Rotations and Substitutions:\n'
                '1. Teams rotate clockwise after winning the serve.\n'
                '2. Each team is allowed 6 substitutions per set.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Essential Volleyball Equipment:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Volleyball:\n'
                '1. Standard circumference: 65-67 cm.\n'
                '2. Weight: 260-280 g.\n'
                '3. Indoor balls are smoother, while outdoor balls are more rugged.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Volleyball Net:\n'
                '1. Height: 2.43 m for men, 2.24 m for women.\n'
                '2. Net width: 1 m, and the length is around 9.5 m.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Volleyball Court:\n'
                '1. Court dimensions: 18 m x 9 m.\n'
                '2. Important lines: Attack line (3m from net), end lines, and sidelines.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Player Gear:\n'
                '1. Jersey, shorts, knee pads, and non-slip court shoes.\n'
                '2. Liberos wear a different-colored jersey.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Other Equipment:\n'
                '1. Whistle for referees.\n'
                '2. Scoreboard to track points and sets.\n',
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
