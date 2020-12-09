import 'dart:ui';

import 'package:flutter/material.dart';

class DataDisplayPage extends StatelessWidget {
  final arguments;

  final _imageUrl =
      'https://images.unsplash.com/photo-1565898835704-3d6be4a2c98c?fit=crop&w=200&q=60';

  // BackdropFilter
  Widget _backdropFilter() {
    return BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 4.0,
          sigmaY: 4.0,
        ),
        child: Container(
          alignment: Alignment.center,
          width: 120.0,
          height: 120.0,
          child: Text('BackdropFilter'),
          decoration: BoxDecoration(
            border: Border.all(width: 2, color: Colors.red),
          ),
        ));
  }

  // Banner
  Widget _banner() {
    return Banner(
      message: "Banner",
      location: BannerLocation.topEnd,
      color: Colors.red[400],
      child: Container(
        color: Colors.yellow[100],
        height: 100,
        child: Center(
          child: Text('Banner > Container'),
        ),
      ),
    );
  }

  // ClipRRect round corner
  Widget _roundClip() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Image.network(_imageUrl, fit: BoxFit.cover),
      ),
    );
  }

  // DecoratedBox
  Widget _decoratedBox() {
    return DecoratedBox(
      position: DecorationPosition.background,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: Border.all(
              width: 4.0, color: Colors.lightGreen, style: BorderStyle.solid),
          borderRadius: BorderRadius.zero,
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              color: Colors.red[200],
              blurRadius: 10.0,
              spreadRadius: 4.0,
            ),
          ]),
    );
  }

  DataDisplayPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 10.0,
      children: [
        Stack(
          children: [
            Text('0' * 1000),
            Center(
              child: ClipRect(child: _backdropFilter()),
            )
          ],
        ),
        ClipRect(
          child: _banner(),
        ),
        _roundClip(),
        Column(
          children: [
            Container(
              margin: EdgeInsets.all(10.0),
              width: 200,
              height: 150,
              child: _decoratedBox(),
            ),
            SizedBox(height: 10.0,),
            Text('DecoratedBox')
          ],
        )
      ],
    );
  }
}
