import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/screens/favourites_screen.dart';
import 'package:flutter_complete_guide/widgets/main_drawer.dart';

import 'categories_screen.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favoratedMeals;

  TabsScreen(this.favoratedMeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  @override
  void initState() {
    _pages = [
      {
        "title": "Categories",
        "page": Categories(),
      },
      {
        "title": "Your Favourites",
        "page": FavouritesScreen(widget.favoratedMeals),
      },
    ];
    super.initState();
  }

  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndex]["title"]),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "Favorites",
          ),
        ],
      ),
    );
  }
}
