import 'package:flutter/material.dart';

class AirPlayScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AirPlay')),
      body: Center(child: Builder(builder: (context) {
        //按照widget类型查找父级widget 的 AppBar.title
        Scaffold scaffold = context.findAncestorWidgetOfExactType<Scaffold>();
        return (scaffold.appBar as AppBar).title;
      })),
    );
  }
}
