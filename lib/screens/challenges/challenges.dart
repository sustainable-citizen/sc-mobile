import 'package:flutter/material.dart';
import '../../widgets/dashboard_widget.dart';


class ChallengeScreen extends StatefulWidget {
  @override
  State createState() => new ChallengeScreenState();
}

class ChallengeScreenState extends State<ChallengeScreen> {
  final List<Widget> _pages = [
    DashboardWidget(Colors.amber),
    DashboardWidget(Colors.indigo)
  ];

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Challenges'),
          bottom: TabBar(
            tabs: [
              Tab(text: "Active"),
              Tab(text: "Completed")
            ]
          )
        ),
        body: TabBarView(
          children: _pages,
        ),
      )
    );
  }
}
