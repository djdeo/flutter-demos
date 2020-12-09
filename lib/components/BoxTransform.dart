import 'package:flutter/material.dart';
import '../bus/EventBus.dart';

EventBus bus = EventBus();

class BoxTransform extends StatefulWidget {
  final selected;
  BoxTransform(this.selected);

  @override
  _BoxTransformState createState() => _BoxTransformState();
}

class _BoxTransformState extends State<BoxTransform>
    with TickerProviderStateMixin {
  final DecorationTween decorationTween = DecorationTween(
    begin: BoxDecoration(
        color: Color(0xFFFFFFFF),
        border: Border.all(
            color: Color(0xFF000000), style: BorderStyle.solid, width: 4.0),
        borderRadius: BorderRadius.zero,
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(
            color: Color(0x66000000),
            blurRadius: 10.0,
            spreadRadius: 4.0,
          )
        ]),
    end: BoxDecoration(
      color: Color(0xFF000000),
      border: Border.all(
          color: Color(0xFF202020), style: BorderStyle.solid, width: 1.0),
      borderRadius: BorderRadius.circular(10.0),
      shape: BoxShape.rectangle,
    ),
  );

  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    bus.on('expand', (arg) {
      print('expand');
      arg ? _controller.forward() : _controller.reverse();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBoxTransition(
      position: DecorationPosition.background,
      decoration: decorationTween.animate(_controller),
      child: Container(
        child: Container(
          width: 100,
          height: 100,
          child: FlutterLogo(),
        ),
      ),
    );
  }
}
