import 'package:flutter/material.dart';
import 'package:my_flutter_app/bottom_appBar_demo.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title:'Flutter Abnormal',
        theme:ThemeData.light(),
        home:BottomAppBarDemo()
    );
  }
}