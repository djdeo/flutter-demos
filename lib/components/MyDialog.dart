import 'package:flutter/material.dart';

class MyDialog extends Dialog {
  final title;
  final content;

  MyDialog(this.title, this.content);

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Text('$title'),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          child: Icon(Icons.close),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Container(
                  padding: EdgeInsets.all(10.0),
                  width: double.infinity,
                  child: Text(
                    '$content',
                    textAlign: TextAlign.left,
                  ),
                )
              ],
            )),
      ),
    );
  }
}
