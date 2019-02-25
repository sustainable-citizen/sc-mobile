import 'package:flutter/material.dart';
import '../../models/user_challenge.dart';

class ActiveChallengeWidget extends StatelessWidget {
  final List<UserChallenge> activeUserChallenges;

  ActiveChallengeWidget({Key key, this.activeUserChallenges});

  final loadingIndicator = Column(children: [
    Padding(
        padding: EdgeInsets.symmetric(vertical: 100.0),
        child: CircularProgressIndicator())
  ]);

  @override
  Widget build(BuildContext context) {
    Container challengeList = Container(
      child: ListView.separated(
        separatorBuilder: (context, index) => Divider(color: Colors.black),
        itemCount:
            activeUserChallenges == null ? 0 : activeUserChallenges.length,
        itemBuilder: (context, index) {
          final challenge = activeUserChallenges[index].challenge;
          return ListTile(
            title: Text(
              "${challenge.name}",
              style: Theme.of(context).textTheme.headline,
            ),
            subtitle: Text("${challenge.description}"),
          );
        },
      ),
    );

    return activeUserChallenges == null ? loadingIndicator : challengeList;
  }
}
