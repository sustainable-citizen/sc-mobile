import 'package:flutter/material.dart';
import 'active.dart';
import 'completed.dart';
import '../../models/user.dart';
import '../../models/user_challenge.dart';
import '../../data/api.dart';

class ChallengeScreen extends StatefulWidget {
  final User user;

  ChallengeScreen({Key key , this.user});

  @override
  State createState() => ChallengeScreenState();
}

class ChallengeScreenState extends State<ChallengeScreen> {

  RestDatasource _api = RestDatasource();
  List<UserChallenge> userChallenges;

  @override
  Widget build(BuildContext context) {

    _api.getUserChallenges(widget.user).then((challenges) {
      if(this.mounted) {
        setState(() => userChallenges = challenges);
      }
    });

    List<Widget> _pages = [
      ActiveChallengeWidget(
        userChallenges: this.userChallenges
      ),
      CompletedChallengeWidget()
    ];

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
