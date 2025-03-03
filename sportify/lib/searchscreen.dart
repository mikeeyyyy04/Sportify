import 'package:flutter/material.dart';
import 'package:sportify/badminton.dart';
import 'package:sportify/basketball.dart';
import 'package:sportify/chess.dart';
import 'package:sportify/cycling.dart';
import 'package:sportify/soccer.dart';
import 'package:sportify/table_tennis.dart';
import 'package:sportify/tennis.dart';
import 'package:sportify/volleyball.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();

  // Sports categories with corresponding screens
  final List<Map<String, dynamic>> _categories = [
    {
      'name': 'Basketball',
      'image': 'assets/basketball.png',
      'screen': BasketballScreen()
    },
    {
      'name': 'Volleyball',
      'image': 'assets/volleyball.png',
      'screen': VolleyballScreen()
    },
    {
      'name': 'Badminton',
      'image': 'assets/badminton.png',
      'screen': BadmintonScreen()
    },
    {'name': 'Soccer', 'image': 'assets/soccer.png', 'screen': SoccerScreen()},
    {'name': 'Tennis', 'image': 'assets/tennis.png', 'screen': TennisScreen()},
    {
      'name': 'Table Tennis',
      'image': 'assets/tabletennis.png',
      'screen': TableTennisScreen()
    },
    {'name': 'Chess', 'image': 'assets/chess.png', 'screen': ChessScreen()},
    {
      'name': 'Cycling',
      'image': 'assets/cycling.png',
      'screen': CyclingScreen()
    },
  ];

  List<Map<String, dynamic>> _filteredCategories = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterCategories);
    _filteredCategories.addAll(_categories);
  }

  void _filterCategories() {
    String query = _searchController.text.toLowerCase().trim();

    setState(() {
      _filteredCategories = _categories.where((category) {
        return category['name'].toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Sport'),
        backgroundColor: Color.fromRGBO(41, 115, 178, 1),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for a sport...',
                prefixIcon: Icon(Icons.search),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          _searchController.clear();
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: _filteredCategories.isEmpty
                ? Center(
                    child: Text(
                      'No results found',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  )
                : GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemCount: _filteredCategories.length,
                    itemBuilder: (context, index) {
                      var category = _filteredCategories[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => category['screen']),
                          );
                        },
                        child: Card(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(category['image'], height: 100),
                              SizedBox(height: 10),
                              Text(
                                category['name'],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
