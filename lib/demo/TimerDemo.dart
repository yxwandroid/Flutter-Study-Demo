import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Timer mTimer ;
  @override
  void initState() {

    // 方法二
    Timer.periodic( Duration( milliseconds: 1000 ), ( timer ) {
      print('一秒钟后输出');
      // 每隔 1 秒钟会调用一次，如果要结束调用
//      timer.cancel();

      mTimer= timer;
    } );
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: (){
                mTimer.cancel();
              },
              child: Text("ee"),
            ),
            Text(
              'You have pushed the button:  en ',
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    if(mTimer!=null){
      mTimer.cancel();
    }
    super.dispose();
  }
}
