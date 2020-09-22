import 'package:flutter/material.dart';

class RadioScreen extends StatefulWidget {
  @override
  _RadioScreenState createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {
  int _radioGroupA = 0;

  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Radio'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('选择结果是：第$_radioGroupA个'),
            // 带图标和标签的单选
            RadioListTile(
              value: 0,
              groupValue: _radioGroupA,
              onChanged: _handleRadioValueChanged,
              title: Text('选项一'),
              subtitle: Text('这是选项一'),
              secondary: Icon(Icons.filter_1),
              selected: _radioGroupA == 0,
            ),
            RadioListTile(
              value: 1,
              groupValue: _radioGroupA,
              onChanged: _handleRadioValueChanged,
              title: Text('选项二'),
              subtitle: Text('这是选项二'),
              secondary: Icon(Icons.filter_1),
              selected: _radioGroupA == 1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Radio(
                  value: 0,
                  groupValue: _radioGroupA,
                  onChanged: _handleRadioValueChanged,
                  activeColor: Colors.blue,
                ),
                Radio(
                  value: 1,
                  groupValue: _radioGroupA,
                  onChanged: _handleRadioValueChanged,
                  activeColor: Colors.blue,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:10),
                      child: Text("呼吸灯"),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:10),
                      child: Radio(
                        value: 0,
                        groupValue: _radioGroupA,
                        onChanged: _handleRadioValueChanged,
                        activeColor: Colors.blue,
                      ),
                    ),
                  ],
                ), Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:10),
                      child: Text("常亮"),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:10),
                      child: Radio(
                        value: 1,
                        groupValue: _radioGroupA,
                        onChanged: _handleRadioValueChanged,
                        activeColor: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text("不亮"),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Radio(
                        value: 2,
                        groupValue: _radioGroupA,
                        onChanged: _handleRadioValueChanged,
                        activeColor: Colors.blue,
                      ),
                    ),
                  ],
                ),

              ],
            )
          ],
        ),
      ),
    );
  }
}
