import 'package:flutter/material.dart';
import '../../models/user_challenge.dart';

class ActiveChallengeWidget extends StatelessWidget {
  final List<UserChallenge> userChallenges;

  ActiveChallengeWidget({Key key, this.userChallenges});

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
      child: ListView.builder(
        itemCount: userChallenges.length,
        itemBuilder: (context, index) {
          final challenge = userChallenges[index];
          return ListTile(
            title: Text(
              "ID: ${challenge.id}",
              style: Theme.of(context).textTheme.headline,
            ),
            subtitle: Text(
              "challenge_id: ${challenge.challengeId}, Status: ${challenge.statusId}"
            ),
          );
        },
      ),
    );

    return userChallenges == null ? loadingIndicator : challengeList;
  }
}
