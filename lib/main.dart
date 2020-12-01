import 'package:flutter/material.dart';
import './pages/feedback.dart';
import './pages/data-entry.dart';
import './pages/data-display.dart';
import './pages/general.dart';
import './pages/layout.dart';
import './pages/navigation.dart';
import './pages/searchPage.dart';

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
    'General': GeneralPage(),
    'Layout': LayoutPage(),
    'Navigation': NavigationPage(),
    'DataEntry': DataEntryPage(),
    'DataDisplay': DataDisplayPage(),
    'Feedback': FeedbackPage(),
    'Other': SearchPage(),
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabsObj.keys.length, // This is the number of tabs.
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Sample'),
          bottom: TabBar(
            isScrollable: true,
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
