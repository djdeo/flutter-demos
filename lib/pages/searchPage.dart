import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final arguments;

  SearchPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('search 页面${arguments != null ? arguments['id'] : '0'}'),
    );
  }
}
