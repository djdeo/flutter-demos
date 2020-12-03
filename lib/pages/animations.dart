import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  final arguments;

  AnimationPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          _gridItemContainer('a'),
          _gridItemContainer('b'),
          _gridItemContainer('c'),
        ],
      ),
    );
  }
}

Widget _gridItemContainer(String hint) {
  return Stack(children: [
    Container(
      child: Center(child: Text('hell~~~')),
    ),
    IconButton(
      icon: Icon(Icons.play_arrow),
      color: Colors.orange[200],
      tooltip: hint,
      onPressed: () {
        
      },
    )
  ]);
}
