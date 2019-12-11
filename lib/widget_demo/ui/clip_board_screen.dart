import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class ClipBoardScreen extends StatefulWidget {
  @override
  ClipBoardScreenState createState() => new ClipBoardScreenState();
}

class ClipBoardScreenState extends State<ClipBoardScreen> {

  String  text ="复制内容 ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClipBoard实现"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            new GestureDetector(
              child: new Tooltip(
                  preferBelow: false, message: "Copy", child: new Text(text)),
              onTap: () {
                Clipboard.setData(new ClipboardData(text: text));
              },
            ),
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
  }


}