import 'package:flutter/material.dart';

class SoccerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Soccer',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor:
            Color.fromARGB(2255, 41, 115, 178), // Set the app bar color here
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
                'Soccer',
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
                '1. Each team has 11 players (1 goalkeeper and 10 outfield players).\n'
                '2. A team must have at least 7 players to continue the game.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Game Structure:\n'
                '1. Duration: 90 minutes, divided into two 45-minute halves with a 15-minute halftime.\n'
                '2. Extra time and penalties are used if a knockout match ends in a draw.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Scoring:\n'
                '1. A goal is scored when the whole ball crosses the goal line between the posts and under the crossbar.\n'
                '2. Each goal counts as 1 point.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Kickoffs and Restarts:\n'
                '1. The game starts with a kickoff from the center circle.\n'
                '2. Throw-ins, goal kicks, and corner kicks restart play when the ball goes out.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Fouls and Misconduct:\n'
                '1. Direct Free Kick: Awarded for serious fouls (e.g., tripping, handball).\n'
                '2. Indirect Free Kick: Given for non-contact offenses (e.g., dangerous play).\n'
                '3. Yellow Card: Warning for unsporting behavior.\n'
                '4. Red Card: Player is sent off and cannot be replaced.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Offside Rule:\n'
                '1. A player is offside if they are nearer to the opponent’s goal than both the ball and the second-last defender when the ball is played, unless they are in their own half.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Penalty Kicks:\n'
                '1. Awarded for a foul inside the penalty area.\n'
                '2. Taken from the penalty spot, 12 yards from the goal.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Essential Soccer Equipment:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Soccer Ball:\n'
                '1. Standard size: Size 5 for adults, Size 4 for youth, and Size 3 for kids.\n'
                '2. Circumference: 68–70 cm; Weight: 410–450 g.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Player Gear:\n'
                '1. Jersey: Each team wears distinct colors.\n'
                '2. Shorts and Socks: Matching team colors.\n'
                '3. Shin Guards: Mandatory for player safety.\n'
                '4. Soccer Cleats: Provide grip on grass or turf.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Goalposts and Net:\n'
                '1. Goal size: 7.32 meters wide and 2.44 meters high.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Soccer Field:\n'
                '1. Full-size field: 100–110 meters long and 64–75 meters wide.\n',
                style: TextStyle(
                  fontSize: 16,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Other Equipment:\n'
                '1. Whistle: Used by referees to start and stop play.\n'
                '2. Flags: For assistant referees.\n'
                '3. Scoreboard: Tracks goals and time.\n',
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
