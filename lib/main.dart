import 'package:flutter/material.dart';
import 'package:my_flutter_app/bottom_appBar_demo.dart';

void main()=> runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title:'Flutter Abnormal',
        debugShowCheckedModeBanner: false, // 去掉右上角的debug图标
        theme:ThemeData.light(),
        home:BottomAppBarDemo()
    );
  }
}