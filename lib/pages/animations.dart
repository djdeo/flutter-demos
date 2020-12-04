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
  final listKey = GlobalKey<AnimatedListState>();
  List<String> _items = ['😀', '😎'];

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

  Widget _animatedList() {
    return AnimatedList(
      key: listKey,
      initialItemCount: _items.length,
      itemBuilder: (context, index, animation) {
        return _buildItem(context, index, animation);
      },
    );
  }

  Widget _buildItem(context, index, animation) {
    String item = _items[index];
    return SlideTransition(
      child: ListTile(title: Text(item)),
      position: Tween<Offset>(begin: Offset(-1, 0), end: Offset.zero)
          .animate(animation),
    );
  }

  // animated opacity
  Widget _opacity() {
    return AnimatedOpacity(
      opacity: _selected ? 0.0 : 1.0,
      duration: Duration(seconds: 2),
      child: FlutterLogo(size: 50),
    );
  }

  // animated padding
  Widget _padding() {
    return AnimatedPadding(
      padding: _selected
          ? EdgeInsets.only(top: 100, bottom: 100)
          : EdgeInsets.only(left: 100, right: 100),
      curve: Curves.bounceOut,
      duration: Duration(seconds: 2),
      child: Container(
        color: Colors.blueAccent,
      ),
    );
  }

  Widget _model() {
    return AnimatedPhysicalModel(
      duration: Duration(milliseconds: 600),
      curve: Curves.easeInOutBack,
      shape: BoxShape.rectangle,
      shadowColor: Colors.black,
      color: Colors.white,
      elevation: _selected ? 0.0 : 6.0,
      borderRadius: _selected ? BorderRadius.all(Radius.circular(0)) : BorderRadius.all(Radius.circular(10)),
      child: Container(
        height: 120,
        width: 120,
        color: Colors.blue[50],
        child: FlutterLogo(size:50),
      ),
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
    bus.on('addList', (arg) {
      setState(() {
        listKey.currentState
            .insertItem(0, duration: Duration(milliseconds: 500));
        _items.add('😂');
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
          _gridItemContainer(
              'AnimatedDefaultTextStyle', _defaultText(), 'expose'),
          _gridItemContainer('AnimatedList', _animatedList(), 'addList'),
          _gridItemContainer('AnimatedOpacity', _opacity(), 'expand'),
          _gridItemContainer('AnimatedPadding', _padding(), 'expand'),
          _gridItemContainer('AnimatedPhysicalModel', _model(), 'expand'),
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
