import 'package:flutter/material.dart';
import 'challenges/challenges.dart';
import 'home/home.dart';
import 'profile/profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeWidget(),
    ChallengeScreen(),
    ProfileWidget()
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.format_list_bulleted),
            title: Text('Challenges'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), title: Text('Profile')),
        ],
      ),
    );
  }
}
