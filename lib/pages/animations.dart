import 'package:flutter/material.dart';
import '../bus/EventBus.dart';
import 'package:my_flutter_app/components/SpinContainer.dart';

EventBus bus = EventBus();

class AnimationPage extends StatefulWidget {
  final arguments;
  AnimationPage({this.arguments});

  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  bool _selected = false;
  double _fontSize = 30.0;
  Color _color = Colors.blue[500];

  Widget _rectContainer() {
    return AnimatedContainer(
      width: _selected ? 200.0 : 100.0,
      height: _selected ? 200.0 : 100.0,
      color: _selected ? Colors.green[100] : Colors.blue[100],
      alignment: _selected ? Alignment.center : AlignmentDirectional.topCenter,
      duration: Duration(seconds: 2),
      curve: Curves.fastOutSlowIn,
      child: FlutterLogo(size: 30),
    );
  }

  Widget _cross() {
    return AnimatedCrossFade(
      duration: const Duration(seconds: 2),
      firstChild: FlutterLogo(
        size: 80,
        style: FlutterLogoStyle.horizontal,
      ),
      secondChild: FlutterLogo(
        size: 80,
        style: FlutterLogoStyle.stacked,
      ),
      crossFadeState:
          _selected ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }

  Widget _defaultText() {
    return AnimatedDefaultTextStyle(
      duration: Duration(milliseconds: 300),
      child: Text('Flutter'),
      style: TextStyle(
          fontSize: _fontSize, color: _color, fontWeight: FontWeight.bold),
    );
  }

  void _switchBorderSize() {
    setState(() {
      _selected = !_selected;
    });
  }

  @override
  void initState() {
    bus.on('expand', (arg) {
      _switchBorderSize();
    });
    bus.on('expose', (arg) {
      setState(() {
        _fontSize = _selected ? 60 : 30;
        _color = _selected ? Colors.blue[500] : Colors.red[500];
        _selected = !_selected;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          _gridItemContainer('AnimatedBuilder', SpinConatiner()),
          _gridItemContainer('AnimatedContainer', _rectContainer(), 'expand'),
          _gridItemContainer('AnimatedCrossFade', _cross(), 'expand'),
          _gridItemContainer('AnimatedDefaultTextStyle', _defaultText(), 'expose'),
        ],
      ),
    );
  }
}

Widget _gridItemContainer(String hint, Widget component, [String eventName]) {
  return Stack(children: [
    Text(hint),
    Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: component,
      ),
    ),
    IconButton(
      icon: Icon(Icons.play_arrow),
      color: Colors.orange[200],
      tooltip: hint,
      onPressed: () {
        bus.emit(eventName);
      },
    )
  ]);
}
