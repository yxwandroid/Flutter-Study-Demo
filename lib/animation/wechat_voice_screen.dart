import 'package:flutter/material.dart';
import 'package:flutter_app_demo/animation/voice_animation_image.dart';

///类似微信语音播放动画
class WeChatVoiceScreen extends StatefulWidget {
  WeChatVoiceScreen({Key key}) : super(key: key);

  @override
  _WeChatVoiceScreenState createState() => _WeChatVoiceScreenState();
}

class _WeChatVoiceScreenState extends State<WeChatVoiceScreen> {
  List<String> _assetList = new List();
  bool isStop = true;

  @override
  void initState() {
    super.initState();

    _assetList.add("images/left_voice_1.png");
    _assetList.add("images/left_voice_2.png");
    _assetList.add("images/left_voice_3.png");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("微信语音播放动画"),
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
