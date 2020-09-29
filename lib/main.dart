import 'package:flutter/material.dart';

void main() => runApp(MyApp(
      items: List<String>.generate(20, (index) => "item ${index + 1}"),
    ));

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Dissmsing time';
    return MaterialApp(
      title: title,
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return Dismissible(
                key: Key(item),
                onDismissed: (direction) {
                  items.removeAt(index);
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('$item dismissed'),
                  ));
                },
                background: Container(color: Colors.red[300],),
                child: ListTile(title: Text('$item')),
              );
            },
          )),
    );
  }
}
