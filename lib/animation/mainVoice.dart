import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flutter_app_demo/eventbus/animation_event.dart';
import 'package:flutter_app_demo/eventbus/native_event.dart';
import 'package:flutter_app_demo/utils/voice_animation_image.dart';

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
  List<String> _assetList = new List();
  Widget voice;
  bool isStop = true;

  VoiceAnimationImage ss;
  @override
  void initState() {
    super.initState();
    _assetList.add("images/left_voice_1.png");
    _assetList.add("images/left_voice_2.png");
    _assetList.add("images/left_voice_3.png");

    ss = VoiceAnimationImage(
      _assetList,
      width: 100,
      height: 100,
      isStop: isStop,
    );
  }

  @override
  Widget build(BuildContext context) {
    print('父控件 0build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          VoiceAnimationImage(
            _assetList,
            width: 100,
            height: 100,
            isStop: isStop,
          ),
          FlatButton(
            child: new Text("开始动画"),
            onPressed: () {
              setState(() {
                isStop = true;
              });
            },
          ),
          FlatButton(
            child: new Text("停止动画"),
            onPressed: () {
              setState(() {
                isStop = false;
              });
            },
          ),
        ],
      ),
    );
  }

  callBackO(bool stop) {
    print(stop);
  }
}
