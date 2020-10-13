import 'package:flutter/material.dart';
import './routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              title: Text('Tabs'),
              bottom: TabBar(
                controller: this._tabController, // 注意提供 controller
                tabs: [
                  Tab(
                    text: '推荐',
                  ),
                  Tab(
                    text: '热销',
                  ),
                ],
              )),
          body: TabBarView(
            controller: this._tabController, // 注意提供 controller
            children: [
              Center(
                child: Text('推荐'),
              ),
              Center(
                child: Text('热销'),
              ),
            ],
          )),
    );
  }
}
