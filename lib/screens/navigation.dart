import 'package:flutter/material.dart';
import 'challenges/challenges.dart';
import 'home/home.dart';
import 'profile/profile.dart';
import '../models/user.dart';

class NavigationScreen extends StatefulWidget {
  final User user;

  const NavigationScreen({Key key, @required this.user});

  @override
  State createState() => NavigationScreenState();
}

class NavigationScreenState extends State<NavigationScreen> {
  int _index = 0;

  void onTabTapped(int newIndex) {
    setState(() {
      _index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [
      HomeWidget(),
      ChallengeScreen(user: widget.user),
      ProfileWidget(user: widget.user)
    ];

    return Scaffold(
      body: _children[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _index,
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
