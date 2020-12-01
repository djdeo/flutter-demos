import 'package:flutter/material.dart';

class GeneralPage extends StatefulWidget {
  final arguments;

  GeneralPage({this.arguments});

  @override
  _GeneralPageState createState() => _GeneralPageState();
}

enum PopItems { harder, smarter, selfStarter, tradingCharter }

class _GeneralPageState extends State<GeneralPage> {
  String dropDownValue = '下拉按钮';
  String _selection = '弹出1';
  int _volume = 0;
  List<bool> isSelected = [false, true, false];

  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            '按钮',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              FlatButton(child: Text('文本按钮'), onPressed: () {}),
              FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.add, size: 18),
                  label: Text('带图标')),
              RaisedButton(
                child: Text('凸起按钮'),
                onPressed: () {},
                color: Colors.blue[400],
                textColor: Colors.white,
              ),
              RaisedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.access_time),
                  label: Text('带图标'))
            ],
          ),
          Divider(
            height: 10.0,
          ),
          Row(
            children: [
              VerticalDivider(
                width: 10.0,
              ),
              Text('Buttonbar =>'),
              ButtonBar(
                children: [
                  FlatButton(
                    child: Text('OK'),
                    onPressed: () {},
                    color: Colors.lightBlue,
                    textColor: Colors.white,
                  ),
                  FlatButton(
                    child: Text('Cancel'),
                    onPressed: () {},
                  ),
                  DropdownButton(
                      value: dropDownValue,
                      items: ['下拉按钮', '下拉按钮two', '下拉按钮three']
                          .map((e) => DropdownMenuItem(
                                child: Text(e),
                                value: e,
                              ))
                          .toList(),
                      onChanged: (newValue) {
                        dropDownValue = newValue;
                        setState(() {});
                      })
                ],
              )
            ],
          ),
          Text(
            '悬浮按钮',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          FloatingActionButton(
            onPressed: () {},
            child: Icon(Icons.thumb_up),
            backgroundColor: Colors.orange[600],
          ),
          Row(
            children: [
              Text(
                'Icon 按钮:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                  icon: Icon(Icons.volume_up),
                  tooltip: '增大10',
                  onPressed: () {
                    setState(() {
                      _volume += 10;
                    });
                  }),
              Text('当前音量: $_volume')
            ],
          ),
          Divider(
            height: 10.0,
          ),
          Row(
            children: [
              Text(
                '弹出按钮:',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              VerticalDivider(
                width: 20.0,
              ),
              Text(
                '选择的值: $_selection',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              PopupMenuButton(
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    child: Text('弹出1'),
                    value: PopItems.harder,
                  ),
                  const PopupMenuItem(
                    child: Text('弹出2'),
                    value: PopItems.smarter,
                  ),
                  const PopupMenuItem(
                    child: Text('弹出3'),
                    value: PopItems.selfStarter,
                  ),
                  const PopupMenuItem(
                    child: Text('弹出4'),
                    value: PopItems.tradingCharter,
                  )
                ],
                onSelected: (result) {
                  print(result);
                  setState(() {
                    _selection = result;
                  });
                },
              )
            ],
          ),
          Text(
            'Toggle Button',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          ToggleButtons(
            children: [
              Icon(Icons.ac_unit),
              Icon(Icons.call),
              Icon(Icons.cake),
            ],
            isSelected: isSelected,
            onPressed: (index) {
              setState(() {
                isSelected[index] = !isSelected[index];
              });
            },
          ),

        ],
      ),
    );
  }
}
