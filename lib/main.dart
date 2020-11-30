import 'package:flutter/material.dart';
import 'package:my_flutter_app/pages/searchPage.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  // List<String> _tabs = ['General', 'Layout', 'Navigation', 'Data Entry', 'Data Display', 'Feedback', 'Other'];
  var _tabsObj = {
    'General': SearchPage(),
    'Layout': SearchPage(),
    'Navigation': SearchPage(),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabsObj.keys.length, // This is the number of tabs.
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: TabBar(
            tabs: _tabsObj.keys.map((String name) => Tab(text: name)).toList(),
          ),
        ),
        body: TabBarView(
          children: _tabsObj.keys.map((String name) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Builder(
                builder: (BuildContext context) {
                  return _tabsObj[name];
                },
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
