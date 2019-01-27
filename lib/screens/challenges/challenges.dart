import 'package:flutter/material.dart';
import 'active.dart';
import 'completed.dart';

class ChallengeScreen extends StatefulWidget {
  @override
  State createState() => ChallengeScreenState();
}

class ChallengeScreenState extends State<ChallengeScreen> {
  final List<Widget> _pages = [
    ActiveChallengeWidget(),
    CompletedChallengeWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Text('Challenges'),
            bottom:
                TabBar(tabs: [Tab(text: "Active"), Tab(text: "Completed")])),
        body: TabBarView(
          children: _pages,
        ),
      )
    );
  }
}
