import 'package:flutter/material.dart';
import '../../models/user_challenge.dart';

class CompletedChallengeWidget extends StatelessWidget {
  final List<UserChallenge> completedUserChallenges;

  CompletedChallengeWidget({Key key, this.completedUserChallenges});

  final loadingIndicator = Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: 100.0),
        child: CircularProgressIndicator()
      )
    ]
  );

  @override
  Widget build(BuildContext context) {
    Container challengeList = Container(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.black),
        itemCount: completedUserChallenges == null ? 0 : completedUserChallenges.length,
        itemBuilder: (context, index) {
          final challenge = completedUserChallenges[index].challenge;
          return ListTile(
            title: Text(
              "${challenge.name}",
              style: Theme.of(context).textTheme.headline,
            ),
            subtitle: Text(
              "${challenge.description}"
            ),
          );
        },
      ),
    );

    return completedUserChallenges == null ? loadingIndicator : challengeList;
  }
}
