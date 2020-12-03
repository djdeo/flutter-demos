import 'package:flutter/material.dart';

class LayoutPage extends StatefulWidget {
  final arguments;

  LayoutPage({this.arguments});

  @override
  _LayoutPageState createState() => _LayoutPageState();
}

class _LayoutPageState extends State<LayoutPage> {
  AlignmentGeometry _alignment = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text('Flexible'),
            Flexible(
              child: Row(
                children: [
                  Flexible(
                      child: Container(
                        color: Colors.blue[100],
                      ),
                      flex: 1),
                  Flexible(
                      child: Container(
                        color: Colors.blue[200],
                      ),
                      flex: 2),
                  Flexible(
                      child: Container(
                        color: Colors.blue[300],
                      ),
                      flex: 3),
                ],
              ),
              flex: 1,
            ),
            Flexible(
              child: Row(
                children: [
                  Expanded(
                      child: Container(
                        height: double.infinity,
                        color: Colors.orange[100],
                        child: Wrap(
                          spacing: 8.0,
                          runSpacing: 4.0,
                          children: [
                            Chip(
                              avatar: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text('W')),
                              label: Text('Wrap'),
                            ),
                            Chip(
                              avatar: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text('W')),
                              label: Text('will'),
                            ),
                            Chip(
                              avatar: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text('G')),
                              label: Text('Go to'),
                            ),
                            Chip(
                              avatar: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text('N')),
                              label: Text('next line'),
                            ),
                            Chip(
                              avatar: CircleAvatar(
                                  backgroundColor: Colors.blue,
                                  child: Text('W')),
                              label: Text('when reach end'),
                            ),
                          ],
                        ),
                      ),
                      flex: 3),
                  Expanded(
                      child: Container(
                        color: Colors.orange[200],
                      ),
                      flex: 2),
                  Expanded(
                      child: Container(
                        color: Colors.orange[300],
                        child: Text('Expanded'),
                        height: double.infinity,
                      ),
                      flex: 1),
                ],
              ),
              flex: 2,
            ),
            Flexible(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  Container(
                    color: Colors.deepPurple[100],
                    width: double.infinity,
                    padding: EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        Container(
                          color: Colors.teal[300],
                          width: 300,
                          height: 300,
                        ),
                        Container(
                          color: Colors.teal[200],
                          width: 100,
                          height: 100,
                        ),
                        Text('Stack'),
                      ],
                    ),
                  ),
                  Container(
                    height: double.infinity,
                    color: Colors.deepPurple[200],
                    child: Stack(
                      children: [
                        Positioned(
                          left: 20,
                          top: 20,
                          right: 20,
                          bottom: 20,
                          child: Container(
                            color: Colors.deepPurple[500],
                          ),
                        ),
                        Positioned(
                          left: 40,
                          top: 40,
                          right: 40,
                          bottom: 40,
                          child: Container(
                            color: Colors.deepPurple[400],
                          ),
                        ),
                        Positioned(
                          left: 60,
                          top: 60,
                          right: 60,
                          bottom: 60,
                          child: Text(
                            'Stack > Positioned',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.deepPurple[300],
                    padding: EdgeInsets.all(20.0),
                    child: Table(
                      children: [
                        TableRow(children: [
                          Text('Table'),
                          Text('Table'),
                          Text('Row A'),
                        ]),
                        TableRow(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1.0, color: Colors.white)),
                            children: [
                              Text('Row'),
                              Text('with'),
                              Text('border'),
                            ]),
                        TableRow(
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)),
                                color: Colors.white),
                            children: [
                              Text('Row'),
                              Text('with'),
                              Text('Bg'),
                            ])
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Expanded(
                        child: Container(
                          color: Colors.deepPurple[400],
                          // 没动画效果
                          child: AnimatedAlign( 
                            alignment: _alignment,
                            curve: Curves.bounceOut,
                            duration: Duration(milliseconds: 1500),
                            child: FlutterLogo(
                              size: 60,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.play_arrow),
                        tooltip: 'AnimatedAlign',
                        color: Colors.white54,
                        onPressed: () {
                          setState(() {
                            _alignment = _alignment == Alignment.topRight
                                ? Alignment.centerLeft
                                : Alignment.topRight;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              flex: 3,
            ),
          ],
        ));
  }
}
