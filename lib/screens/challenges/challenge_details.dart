import '../../models/user_challenge.dart';
import '../../models/challenge.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final String title;
  final String body;

  Detail({
    Key key,
    @required this.title,
    @required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            Text(body)
          ],
        ));
  }
}

class ChallengeDetails extends StatelessWidget {
  final UserChallenge userChallenge;

  ChallengeDetails({Key key, @required this.userChallenge});

  @override
  Widget build(BuildContext context) {
    Challenge challenge = userChallenge.challenge;

    Detail name = Detail(title: "Name", body: challenge.name);

    Detail description =
        Detail(title: "Description", body: challenge.description);

    Detail startDate =
        Detail(title: "Start Date", body: challenge.startDate.toString());

    Detail endDate =
        Detail(title: "End Date", body: challenge.endDate.toString());

    Column details =
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[name, description, startDate, endDate]
        );

    return Scaffold(
        appBar: AppBar(
          title: Text("Challenge Details"),
        ),
        body: details);
  }
}
