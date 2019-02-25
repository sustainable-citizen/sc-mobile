import 'package:flutter/material.dart';
import 'active.dart';
import 'completed.dart';
import '../../models/user.dart';
import '../../models/user_challenge.dart';
import '../../data/api.dart';
import '../../constants/data_constants.dart';

class ChallengeScreen extends StatefulWidget {
  final User user;

  ChallengeScreen({Key key, this.user});

  @override
  State createState() => ChallengeScreenState();
}

class ChallengeScreenState extends State<ChallengeScreen> {
  RestDatasource _api = RestDatasource();
  List<UserChallenge> activeUserChallenges;
  List<UserChallenge> completedUserChallenges;

  @override
  Widget build(BuildContext context) {
    _api.getUserChallenges(widget.user).then((challenges) {
      if (this.mounted) {
        setState(() {
          activeUserChallenges = challenges
              .where((challenge) => challenge.status == ACTIVE)
              .toList();
          completedUserChallenges = challenges
              .where((challenge) => challenge.status == COMPLETED)
              .toList();
        });
      }
    });

    List<Widget> _pages = [
      ActiveChallengeWidget(activeUserChallenges: this.activeUserChallenges, user: widget.user),
      CompletedChallengeWidget(
          completedUserChallenges: this.completedUserChallenges)
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
        ));
  }
}
