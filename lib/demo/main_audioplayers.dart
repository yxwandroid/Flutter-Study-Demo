//import 'package:flutter/material.dart';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:flutter/foundation.dart';
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      title: 'Flutter Demo',
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Flutter Demo Home Page'),
//    );
//  }
//}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  _MyHomePageState createState() => _MyHomePageState();
//}
//
//class _MyHomePageState extends State<MyHomePage> {
//
//// String  url = 'https://kefures.oss-cn-shenzhen.aliyuncs.com/weremote/chat-logs/8D2B68A578A8463381640F8E4CB62554/34/msg_21135906041956194873707103.mp3';
//
// String  url ="https://luan.xyz/files/audio/nasa_on_a_mission.mp3";
//
// bool isPlay = false;
// AudioPlayer audioPlayer;
//
//
// @override
//  void initState() {
//    super.initState();
//    audioPlayer = AudioPlayer();
//  }
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: Center(
//        child: new RaisedButton(
//           child: new Text("播放"),
//            onPressed: (){
//             if(!isPlay){
//               play();
//             }else{
//               stop();
//             }
//
//        }),
//      ),
//    );
//  }
//
//
//
//  play() async {
//    int result = await audioPlayer.play(url);
//    if (result == 1) {
//      isPlay= true;
//      print("play success");
//    }
//  }
//
//  stop() async {
//    int result = await audioPlayer.stop();
//    if (result == 1) {
//      isPlay= false;
//      print("stop success");
//    }
//  }
//}
//
//
