import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/airplay_screen.dart';
import 'package:my_flutter_app/pages/email_screen.dart';
import 'package:my_flutter_app/pages/home_screen.dart';
import 'package:my_flutter_app/pages/pages_screen.dart';

class BottomNavigationWidget extends StatefulWidget {
  @override
  _BottomNavigationWidgetState createState() => _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  // 参数1 颜色
  final _buttonNavigationColor = Colors.blueAccent;
  int _currentIndex = 0;
  List<Widget> list = List();
  // 重写initState()方法
  @override
  void initState() {
    list
      ..add(HomeScreen())
      ..add(EmailScreen())
      ..add(PagesScreen())
      ..add(AirPlayScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: _buttonNavigationColor,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: _buttonNavigationColor,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.email,
                  color: _buttonNavigationColor,
                ),
                title: Text(
                  'Email',
                  style: TextStyle(
                    color: _buttonNavigationColor,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.pages,
                  color: _buttonNavigationColor,
                ),
                title: Text(
                  'Pages',
                  style: TextStyle(
                    color: _buttonNavigationColor,
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.airplay,
                  color: _buttonNavigationColor,
                ),
                title: Text(
                  'AirPlay',
                  style: TextStyle(
                    color: _buttonNavigationColor,
                  ),
                )),
          ],
          currentIndex: _currentIndex,
          onTap: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed),
    );
  }
}
