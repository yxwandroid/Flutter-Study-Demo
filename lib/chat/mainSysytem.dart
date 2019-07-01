import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/utils/utils.dart';



class MyChat extends StatefulWidget {
  MyChat({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyChatState createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  static String avatar;
  @override
  void initState() {
    super.initState();
    avatar =
        "https://kefures.oss-cn-shenzhen.aliyuncs.com/avatar/8D2B68A578A8463381640F8E4CB62554/fb91beb7b653530bd00069aa4550af22.png";
    //
    //    String  jsonStr  = "{\"durationMs\":3084,\"url\":\"https://kefures.oss-cn-shenzhen.aliyuncs.com/weremote/chat-logs/8D2B68A578A8463381640F8E4CB62554/34/msg_22100206041956194873fe7100.mp3\"}";
    //    Map<String, dynamic> jsonObject = json.decode(jsonStr);
    //    print(jsonObject["url"]);

    //
    //    String  content = "wxid_8mpz7k4zi1di12:\nhttps://kefures.oss-cn-shenzhen.aliyuncs.com/weremote/chat-logs/8D2B68A578A8463381640F8E4CB62554/34/msg_3915280604193004b7ef80b106.mp3";
    //    String temp = content.replaceAll("\n", "");
    //    List<String> contents = temp.split(':');
    //    String wechatId = contents[0];
    //    String msg = contents[1]+":"+contents[2];
    //    print(msg);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: buildChatLeftVoice(),
    );
  }

  static Widget buildMemberChange() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Center(
        child: Container(
          width: 300,
            padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
            decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.all(
                Radius.circular(5.0),
              ),
            ),
            child: new Text(
              "337373337373373733373733373733373337373337373373733373733373733373733373733373733373733373733373733373733373733373733337373337373337373337373733373733373733373733373733373733373733373733373733337373337373337373337373",
              textAlign: TextAlign.center,
            )),
      ),
    );
  }

  ///聊天左侧语音界面
  static Widget buildChatLeftVoice() {
    return Container(
      color: Colors.black,
      margin: const EdgeInsets.only(left: 5.0, right: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, //对齐方式，左上对齐
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(avatar),
            radius: 20.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 5.0, right: 0, top: 0),
            child: Container(
              width: 80,
              height: 50,
              decoration: BoxDecoration(
                //设置背景
                color: Colors.yellow,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                //对齐方式，左上对齐
                children: <Widget>[
                  Container(
                      color: Colors.black,
                      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: new Text("60\"")),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: new Image.asset(
                          Utils.getImgPath("chat_room_left_voice"))),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
