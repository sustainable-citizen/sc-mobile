import 'package:flutter/material.dart';
import '../../models/user_challenge.dart';
import 'challenge_details.dart';
import '../../models/user.dart';

class CompletedChallengeWidget extends StatelessWidget {
  final List<UserChallenge> completedUserChallenges;
  final User user;
  final Function completeUserChallenge;

  CompletedChallengeWidget(
      {Key key,
      this.completedUserChallenges,
      this.user,
      this.completeUserChallenge});

  final loadingIndicator = Column(children: [
    Padding(
        padding: EdgeInsets.symmetric(vertical: 100.0),
        child: CircularProgressIndicator())
  ]);

  viewDetails(context, userChallenge) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChallengeDetails(
              userChallenge: userChallenge,
              user: user,
              completeUserChallenge: completeUserChallenge,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Container challengeList = Container(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.black),
        itemCount: completedUserChallenges == null
            ? 0
            : completedUserChallenges.length,
        itemBuilder: (context, index) {
          final userChallenge = completedUserChallenges[index];
          final challenge = userChallenge.challenge;
          return ListTile(
              title: Text(
                "${challenge.name}",
                style: Theme.of(context).textTheme.headline,
              ),
              subtitle: Text("${challenge.description}"),
              onTap: () => viewDetails(context, userChallenge));
        },
      ),
    );

    return completedUserChallenges == null ? loadingIndicator : challengeList;
  }
}
