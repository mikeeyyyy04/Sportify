import 'package:flutter/material.dart';

class TennisScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tennis',
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
                'Tennis',
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
                '1. Love (0), 15, 30, 40, Game\n'
                '2. A player must win four points to win a game, but they must be ahead by at least two points.\n'
                '3. Deuce occurs at 40-40; a player must win two consecutive points to win the game.\n'
                '4. A set is won by the first player/team to win six games with a two-game lead.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Serving:\n'
                '1. The server must stand behind the baseline and hit the ball into the opponent’s service box.\n'
                '2. Each player gets two attempts (first and second serve).\n'
                '3. If the ball hits the net and lands in the correct service box, it’s a let and the serve is retaken.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Ball in Play:\n'
                '1. The ball must land within the court lines to be considered in.\n'
                '2. If the ball touches the net during a rally but still lands in, the play continues.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Faults & Violations:\n'
                '1. Double Fault – If a player misses both serve attempts, the opponent gets a point.\n'
                '2. Foot Fault – If the server’s foot crosses the baseline before hitting the ball.\n'
                '3. Out of Bounds – If the ball lands outside the court lines.\n'
                '4. Hindrance – Players must not distract or interfere with their opponents.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Winning the Match:\n'
                '1. A match is usually played in best of three or best of five sets.\n'
                '2. The player/team that wins the required number of sets wins the match.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Sports Equipment Needed in Tennis:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Tennis Racket:\n'
                '1. Used to hit the ball; must follow size and weight regulations.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Text(
                'Tennis Ball:\n'
                '1. Pressurized rubber ball covered with felt, usually yellow.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Text(
                'Tennis Court:\n'
                '1. Hard, clay, or grass surface with marked lines.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Text(
                'Net:\n'
                '1. Divides the court in half; must be 3 feet high at the center.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Text(
                'Tennis Shoes:\n'
                '1. Special shoes for grip, stability, and movement.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Text(
                'Additional Gear:\n'
                '1. Clothing – Players typically wear breathable sportswear (shorts, skirts, shirts).\n'
                '2. Wristbands & Headbands (Optional) – Helps absorb sweat.\n',
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
