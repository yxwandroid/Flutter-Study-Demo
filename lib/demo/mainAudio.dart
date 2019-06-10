import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';
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

const  kUrl = 'http://m10.music.126.net/20190606154312/8e4f4ae65f9a682002f482e5c5632a6c/ymusic/d60e/d53a/a031/1578f4093912b3c1f41a0bfd6c10115d.mp3';

class _MyHomePageState extends State<MyHomePage> {


  bool isPlay = false;
  AudioPlayer audioPlayer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = new AudioPlayer();
  }

  Future<void> play() async {
    await audioPlayer.play(kUrl);
    isPlay = true;
  }

  Future<void> stop() async {
    await audioPlayer.stop();
    isPlay = false;

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
            RaisedButton(
              onPressed: (){

                if(isPlay){
                  stop();
                }else{
                  play();
                }

              },
              child: new Text("play"),
            ),
          ],
        ),
      ),
    );
  }
}
