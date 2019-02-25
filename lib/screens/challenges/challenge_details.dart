import '../../models/user_challenge.dart';
import '../../models/challenge.dart';
import 'package:flutter/material.dart';
import '../../constants/data_constants.dart';
import '../../data/api.dart';
import '../../models/user.dart';

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

class ChallengeDetails extends StatefulWidget {
  final UserChallenge userChallenge;
  final User user;


  ChallengeDetails({Key key, this.userChallenge, this.user});

  @override
  State createState() => ChallengeDetailsState();
}

class ChallengeDetailsState extends State<ChallengeDetails> {
  bool _isLoading = false;
  RestDatasource _api = RestDatasource();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  completeChallenge(context) {
    widget.userChallenge.status = COMPLETED;
    setState(() => _isLoading = true);
    _api.updateUserChallenge(widget.user, widget.userChallenge).then((status) {
      if (status) {
        print("Completing a challenge");
        setState(() => _isLoading = false);
      } else {
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("There was a problem completeing the challenge. Please contact Sustainable Citizen for assistance.")));
        setState(() => _isLoading = false);
      }
    }); 
    
  }

  confirmCompletion(context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Complete the Challenge?"),
            content: new Text("This will move the challenge under the Completed tab"),
            actions: <Widget>[
              // usually buttons at the bottom of the dialog
              FlatButton(
                child: Text("Cancel"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("Complete"),
                onPressed: () {
                  Navigator.pop(context);
                  completeChallenge(context);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    Challenge challenge = widget.userChallenge.challenge;

    final name = Detail(title: "Name", body: challenge.name);

    final description =
        Detail(title: "Description", body: challenge.description);

    final startDate =
        Detail(title: "Start Date", body: challenge.startDate.toString());

    final endDate =
        Detail(title: "End Date", body: challenge.endDate.toString());

    List<Widget> detailElements = [name, description, startDate, endDate];

    final completeButton = Padding(
      padding: EdgeInsets.all(16.0),
      child: RaisedButton(
        onPressed: () => confirmCompletion(context),
        child: Text("Complete"),
        color: Colors.green,
      ),
    );

    final progressIndicator = Padding(
      padding: EdgeInsets.all(16.0),
      child: CircularProgressIndicator());

    if (_isLoading == true) {
      detailElements.add(progressIndicator);
    }
    else if (widget.userChallenge.status == ACTIVE) {
      detailElements.add(completeButton);
    }

    Column details = Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: detailElements);

    return Scaffold(
        appBar: AppBar(
          title: Text("Challenge Details"),
        ),
        body: details);
  }
}
