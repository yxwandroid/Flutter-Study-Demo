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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child:_buildChatLeftVoice("https://pp.myapp.com/ma_icon/0/icon_42284557_1517984341/96"),
      ),
    );
  }

//  http://wx.qlogo.cn/mmhead/ver_1/g2eNdU7Zfvria6O99VKnw8IItlNhurBYBvkJmSJZy0JIGUH3VvRGVSe2bK6Dcia5lforNXp02wL9d4Ffg9xsGOyLhvibfqClraqqw39TyF9Gto/0
  ///聊天左侧语音
  Widget _buildChatLeftVoice(message) {


    Widget voiceWidget = new Container(
      child:new Row(children: <Widget>[
        Image.asset("assets/images/voice_left.png")
      ],),);
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, //对齐方式，左上对齐
        children: <Widget>[
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://pp.myapp.com/ma_icon/0/icon_42284557_1517984341/96'),
            radius: 20.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
            child:voiceWidget ,
          )
        ],
      ),
    );
  }
}
