import 'package:flutter/material.dart';
import 'package:sportify/badminton.dart';
import 'package:sportify/basketball.dart';
import 'package:sportify/camera_screen.dart';
import 'package:sportify/chess.dart';
import 'package:sportify/cycling.dart';
import 'package:sportify/searchscreen.dart';
import 'package:sportify/soccer.dart';
import 'package:sportify/table_tennis.dart';
import 'package:sportify/tennis.dart';
import 'package:sportify/volleyball.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) {
      // Navigate to CameraScreen when "Diagnose" is tapped
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => CameraScreen()),
      );
    } else {
      setState(() {
        _selectedIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(160.0),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20.0)),
          child: AppBar(
            backgroundColor: Color.fromRGBO(41, 115, 178, 1),
            flexibleSpace: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20.0),
                  child: Text(
                    'Welcome Sport Lover',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SearchScreen()),
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 12.0),
                            child: Row(
                              children: [
                                Icon(Icons.search, color: Colors.white),
                                SizedBox(width: 10),
                                Text(
                                  'Search here...',
                                  style: TextStyle(
                                      color: Colors.white70, fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                childAspectRatio: 0.8,
                children: <Widget>[
                  CategoryCard('Basketball', Colors.white,
                      'assets/basketball.png', BasketballScreen()),
                  CategoryCard('Volleyball', Colors.white,
                      'assets/volleyball.png', VolleyballScreen()),
                  CategoryCard('Badminton', Colors.white,
                      'assets/badminton.png', BadmintonScreen()),
                  CategoryCard('Soccer', Colors.white, 'assets/soccer.png',
                      SoccerScreen()),
                  CategoryCard('Tennis', Colors.white, 'assets/tennis.png',
                      TennisScreen()),
                  CategoryCard('Table Tennis', Colors.white,
                      'assets/tabletennis.png', TableTennisScreen()),
                  CategoryCard(
                      'Chess', Colors.white, 'assets/chess.png', ChessScreen()),
                  CategoryCard('Cycling', Colors.white, 'assets/cycling.png',
                      CyclingScreen()),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Diagnose',
            activeIcon: Icon(Icons.camera_alt,
                color: Color.fromARGB(255, 172, 173, 172)),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_florist), label: 'My Garden'),
          BottomNavigationBarItem(
              icon: Icon(Icons.help), label: 'Ask Botanist'),
        ],
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String title;
  final Color color;
  final String imagePath;
  final Widget route;

  CategoryCard(this.title, this.color, this.imagePath, this.route);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => route),
        );
      },
      child: Card(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(imagePath, height: 150),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
