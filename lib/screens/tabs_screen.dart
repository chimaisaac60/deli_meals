import '/models/meals.dart';

import '/widget/main_drawer.dart';

import 'favorites_screen.dart';
import 'package:flutter/material.dart';

import 'categories_screen.dart';

class TabsSreen extends StatefulWidget {
  final List<Meal> _favoriteMeals;

  TabsSreen(this._favoriteMeals);

  @override
  _TabsSreenState createState() => _TabsSreenState();
}

class _TabsSreenState extends State<TabsSreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() { 
    _pages = [
    {'page':CategoriesScreen(), 'title': 'Categories'},
    {'page':FavoritesScreen(widget._favoriteMeals), 'title': 'My Favorites'},
  ];
    super.initState();
    
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage ,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );

    // the code below is for adding tabs at the top of the screen
    //  DefaultTabController(
    //   length: 2,
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: Text('meals'),
    //       bottom: TabBar(
    //         tabs: [
    //           Tab(
    //             icon: Icon(
    //               Icons.category,
    //             ),
    //             text: 'Category',
    //           ),
    //           Tab(
    //             icon: Icon(
    //               Icons.star,
    //             ),
    //             text: 'Favorite',
    //           ),
    //         ],
    //       ),
    //     ),
    //     body: TabBarView(children: [
    //       CategoriesScreen(),
    //       FavoritesScreen(),
    //     ],),
    //   ),
    // );
  }
}
