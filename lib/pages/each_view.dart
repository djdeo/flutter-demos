import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class EachView extends StatefulWidget {
  String _title;
  EachView(this._title);

  @override
  _EachViewState createState() => _EachViewState();
}

class _EachViewState extends State<EachView> {
  @override
  Widget build(BuildContext context) {
    // 使用第三方包
    final wordPair = WordPair.random();
    return Scaffold(
        appBar: AppBar(
          title: Text(widget._title),
        ),
        body: Column(
          children: [
            ClipPath(
              clipper: BottomClipper(),
              child: Container(
                color: Colors.yellow[600],
                height: 200,
              ),
            ),
            Container(
              color: Colors.yellow[500],
              padding: EdgeInsets.all(30.0),
              child: Text('inside container'),
            ),
            Center(
                child: widget._title == 'Home'
                    ? Text(wordPair.toString(), textScaleFactor: 1.5,)
                    : RaisedButton.icon(
                        icon: Icon(Icons.chevron_left),
                        color: Colors.lightBlueAccent,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () =>
                            Navigator.pop(context, 'son json data'),
                        label: Text('返回'))),

          ],
        ));
  }
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 20);
    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2.25, size.height - 30);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width / 4 * 3, size.height - 80);
    var secondEndPoint = Offset(size.width, size.height - 40);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
