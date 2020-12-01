import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/MyDialog.dart';

class FeedbackPage extends StatelessWidget {
  final arguments;

  FeedbackPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    Future<void> _openAlertDialog() async {
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
                child: Text('Get It'),
                onPressed: () {
                  print('pressed Get It');
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    _showSnackBar() {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          content: Text('A SnackBar has been shown.'),
          action: SnackBarAction(label: 'Close', onPressed: () {}),
        ),
      );
    }

    _showSimpleDialog() {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text('Simple Dialog'),
            children: [
              SimpleDialogOption(
                child: Text('first option'),
                onPressed: () {
                  print('first option pressed');
                  Navigator.pop(context);
                },
              )
            ],
          );
        },
      );
    }

    _showBottomSheet() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              height: 200,
              child: Column(
                children: [
                  ListTile(
                    title: Text('分享 A'),
                    onTap: () {},
                  ),
                  // Divider(),
                  ListTile(
                    title: Text('分享 B'),
                    onTap: () {},
                  ),
                  // Divider(),
                  ListTile(
                    title: Text('分享 C'),
                    onTap: () {},
                  ),
                ],
              ),
            );
          });
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              OutlineButton(
                child: Text('AlertDialog'),
                onPressed: () {
                  _openAlertDialog();
                },
              ),
              VerticalDivider(
                width: 10.0,
              ),
              RaisedButton(
                child: Text('SnackBar'),
                color: Colors.amber[500],
                onPressed: () {
                  _showSnackBar();
                },
              ),
              VerticalDivider(
                width: 10.0,
              ),
              OutlineButton(
                child: Text('SimpleDialog'),
                onPressed: () {
                  _showSimpleDialog();
                },
              )
            ],
          ),
          OutlineButton(
            child: Text('底部展开'),
            onPressed: () {
              _showBottomSheet();
            },
          ),
          Text('还可以引入第三方toast, 访问 pub.dev '),
          RaisedButton(
            child: Text('自定义Dialog'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return MyDialog('标头', '内容');
                  });
            },
          )
        ],
      ),
    );
  }
}
