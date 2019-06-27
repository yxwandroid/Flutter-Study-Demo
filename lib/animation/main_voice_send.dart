import 'package:flutter/material.dart';

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
  ///默认隐藏状态
  bool isVoiceState = true;

  @override
  void initState() {
    super.initState();
  }

  showVoiceView() {
    setState(() {
      textShow = "松开结束";
      isVoiceState = false;
    });
  }

  hideVoiceView() {
    setState(() {
      textShow = "按住说话";
      isVoiceState = true;
    });

    if(isUp){
      print("取消发送");
    }else{
      print("进行发送");
    }
  }

  moveVoiceView(){
   // print(offset - start);
    setState(() {
      isUp = start - offset > 100 ? true : false;
      if (isUp) {
        textShow = "松开手指,取消发送";
        toastShow = textShow;
      } else {
        textShow = "松开结束";
        toastShow = "手指上滑,取消发送";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wwww"),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Offstage(
                offstage: isVoiceState,
                child: Center(
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
                            margin: EdgeInsets.only(top: 10),
                            child: new Image.asset(
                              "images/voice_volume_7.png",
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Container(
                            padding:
                                EdgeInsets.only(right: 20, left: 20, top: 0),
                            child: Text(
                              toastShow,
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onVerticalDragStart: (details) {
                start = details.globalPosition.dy;
                showVoiceView();
              },
              onVerticalDragEnd: (details) {
                hideVoiceView();
              },
              onVerticalDragUpdate: (details) {
                offset = details.globalPosition.dy;
                moveVoiceView();
              },
              child: Container(
                height: 60,
                color: Colors.blue,
                margin: EdgeInsets.fromLTRB(50, 0, 50, 20),
                child: Center(
                  child: Text(
                    textShow,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
