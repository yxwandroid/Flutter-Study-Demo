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
      home: VoiceView(title: 'Flutter Demo Home Page'),
    );
  }
}

class VoiceView extends StatefulWidget {
  VoiceView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _VoiceViewState createState() => _VoiceViewState();
}

class _VoiceViewState extends State<VoiceView> {
  double start = 0.0;
  double offset = 0.0;
  bool isUp = false;
  String textShow = "按住说话";
  String toastShow = "手指上滑,取消发送";

  bool isVoiceState = true; ///默认隐藏状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GestureDetector(
        onVerticalDragStart: (details) {
          start = details.globalPosition.dy;
          setState(() {
            textShow = "松开结束";
          });
        },
        onVerticalDragEnd: (details) {
          setState(() {
            textShow = "按住说话";
            isVoiceState = true;
          });
        },
        onVerticalDragUpdate: (details) {
          offset = details.globalPosition.dy;

          print(offset - start);
          setState(() {
            isUp = start - offset > 100 ? true : false;
            if (isUp) {
              textShow = "松开手指,取消发送";
              toastShow= textShow;
              isVoiceState = false;
            } else {
              textShow = "松开结束";
              toastShow = "手指上滑,取消发送";
            }
          });
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Offstage(
            offstage: isVoiceState,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      width: 160,
                      height: 160,
                      decoration: BoxDecoration(
                        color: Color(0xff77797A),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin:EdgeInsets.only(top: 10),
                            child: new Image.asset(
                              "images/voice_volume_7.png",
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Container(
                            padding:EdgeInsets.only(right:20,left:20,top: 0),
                            child: Text(
                              toastShow,style: TextStyle(color: Colors.white),),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Text(
                  textShow,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
