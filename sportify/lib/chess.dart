import 'package:flutter/material.dart';

class ChessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basketball'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Basketball',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Rules of the Game:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '1. The game is played with two teams of five players each.\n'
              '2. The objective is to score points by shooting the ball through the opponent\'s basket.\n'
              '3. The game consists of four quarters, each lasting 12 minutes (NBA) or 10 minutes (FIBA).\n'
              '4. Players can move the ball by dribbling or passing.\n'
              '5. Fouls are called for illegal physical contact or violations of the rules.\n'
              '6. Free throws are awarded for certain fouls, giving the fouled player an opportunity to score points unopposed.\n'
              '7. The team with the most points at the end of the game wins.',
            ),
            SizedBox(height: 16),
            Text(
              'Sports Equipment Needed:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              '1. Basketball\n'
              '2. Basketball hoop and backboard\n'
              '3. Basketball court\n'
              '4. Basketball shoes\n'
              '5. Uniforms (jerseys and shorts)\n'
              '6. Shot clock and game clock',
            ),
          ],
        ),
      ),
    );
  }
}
