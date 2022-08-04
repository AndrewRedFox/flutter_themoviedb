import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../movie_list/move_list_widget.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({Key? key}) : super(key: key);

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  void onSelectTab(int index){
    if(_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final buttonNavigationbar = BottomNavigationBar(
      currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'News'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Films'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'Serials'
            ),
        ],
        onTap: onSelectTab,
      );

    return Scaffold(
      appBar: AppBar(
        title: Text('TMDB'),
        centerTitle: true,
      ),
      body: IndexedStack( // виджеты существуют одновременно
        index: _selectedTab,
        children: [
          Text('News'),
          MoveListWidget(),
          Text('Serials'),
        ],
      ),
      bottomNavigationBar: buttonNavigationbar,
    );
  }
}