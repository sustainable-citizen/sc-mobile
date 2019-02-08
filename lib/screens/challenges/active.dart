import 'package:flutter/material.dart';
import '../../models/user_challenge.dart';

class ActiveChallengeWidget extends StatelessWidget {
  final List<UserChallenge> userChallenges;

  ActiveChallengeWidget({Key key, this.userChallenges});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              "Challenge_id: ${challenge.userId}, Status: ${challenge.statusId}"
            ),
          );
        },
      ),
    );
  }
}
