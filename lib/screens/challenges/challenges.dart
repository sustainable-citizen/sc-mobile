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
  void initState() {
    super.initState();
    _api.getUserChallenges(widget.user).then((challenges) {
      if (this.mounted) {
        setState(() {
          challenges.retainWhere((challenge) =>
              DateTime.now().compareTo(challenge.challenge.startDate) >= 0);
          activeUserChallenges = challenges
              .where((challenge) => challenge.status == ACTIVE)
              .toList();
          completedUserChallenges = challenges
              .where((challenge) => challenge.status == COMPLETED)
              .toList();
        });
      }
    });
  }

  Future<bool> completeUserChallenge(UserChallenge userChallenge) async {
    userChallenge.status = COMPLETED;

    bool status = await _api.updateUserChallenge(widget.user, userChallenge);
    if (status) {
      setState(() {
        activeUserChallenges.removeWhere((i) => i.id == userChallenge.id);
        completedUserChallenges.add(userChallenge);
      });
    }
    return status;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      ActiveChallengeWidget(
        activeUserChallenges: this.activeUserChallenges,
        user: widget.user,
        completeUserChallenge: completeUserChallenge,
      ),
      CompletedChallengeWidget(
          completedUserChallenges: this.completedUserChallenges,
          user: widget.user,
          completeUserChallenge: completeUserChallenge,)
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
