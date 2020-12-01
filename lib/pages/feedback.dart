import 'package:flutter/material.dart';

class FeedbackPage extends StatelessWidget {
  final arguments;

  FeedbackPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    Future<void> _neverSatisfied() async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Rewind and remember'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('You will never be satisfied.'),
                  Text('You\’re like me. I’m never satisfied.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Regret'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        
        children: [
          OutlineButton(
            child: Text('AlertDialog'),
            onPressed: () {
              _neverSatisfied();
            },
          )
        ],
      ),
    );
  }
}
