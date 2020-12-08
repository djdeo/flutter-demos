import 'dart:ui';

import 'package:flutter/material.dart';

class DataDisplayPage extends StatelessWidget {
  final arguments;

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

  final _imageUrl =
      'https://images.unsplash.com/photo-1565898835704-3d6be4a2c98c?fit=crop&w=200&q=60';

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
        _roundClip()
      ],
    );
  }
}
