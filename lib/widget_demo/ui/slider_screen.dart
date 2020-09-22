
import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  @override
  _SliderScreenState createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _value = 0;
  int _dollars = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(30, 35, 30, 0),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.red]),// 渐变色
                borderRadius: BorderRadius.circular(25)
            ),
            child: Slider(
              value: _value,
              onChanged: (newValue) {
                print('onChanged:$newValue');
                setState(() {
                  _value = newValue;
                });
              },
              onChangeStart: (startValue) {
                print('onChangeStart:$startValue');
              },
              onChangeEnd: (endValue) {
                print('onChangeEnd:$endValue');
              },
              label: '$_value dollars',
              divisions: 10,
              semanticFormatterCallback: (newValue) {
                return '${newValue.round()} dollars';
              },
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(30, 35, 30, 0),
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [Colors.blue, Colors.red]),// 渐变色
                borderRadius: BorderRadius.circular(25)
            ),
            child: Slider(
                value: _dollars.toDouble(),
                min: 20.0,
                max: 330.0,
                label: '$_dollars dollars',
                onChanged: (double newValue) {
                  setState(() {
                    _dollars = newValue.round();
                  });
                },
                semanticFormatterCallback: (double newValue) {
                  return '${newValue.round()} dollars';
                }),
          ),

        ],
      ),
    );
  }
}
