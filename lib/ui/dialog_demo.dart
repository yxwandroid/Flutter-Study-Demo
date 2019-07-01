import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogDemo extends StatefulWidget {
  static enter(BuildContext context) {
    return Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext content) => DialogDemo()));
  }

  @override
  DialogDemoState createState() => new DialogDemoState();
}

class DialogDemoState extends State<DialogDemo> {


  var _groupTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: FlatButton(onPressed: () {}, child: new Text('对话框')),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              FlatButton(
                  onPressed: () {
                    showAndroidAlertDialog(context);
                  },
                  child: Text("Android 风格 对话框")),
              FlatButton(
                  onPressed: () {
                    showAndroidAlertDialog(context);
                  },
                  child: Text("IOS 风格 对话框")),
            ],
          ),
        ),
      ),
    );
  }

  void showAndroidAlertDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: Text("标题"),
              content: Container(
                  height: 100,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image.asset(
                              "images/search.png",
                              width: 20,
                              height: 20,
                            ),
                            new Text("价格可以优惠吗!"),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new FlatButton(
                              child: new Text("取消"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            new FlatButton(
                              child: new Text("发送"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ));
  }


  Future<void> _displayDialog() async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            content: Material(
              child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          '打招呼',

                          style: TextStyle(color: Colors.black,
                              fontSize: 18
                          ),
                        ),
                      ),
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                            border: Border.all(color: Color(0xffF2F2F2),width: 0.1),
                            borderRadius: BorderRadius.all(Radius.circular(0.1))),
                        child: TextField(
                          maxLines: 3,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10,top:10,right: 10,bottom: 10),
                              border: OutlineInputBorder(
                                // borderRadius: BorderRadius.circular(15.0),
                                  borderSide: BorderSide(color: Colors.white))),
                          controller: _groupTextFieldController,
                        ),
                      ),
                    ],
                  )),
            ),
            actions: <Widget>[
              new CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('取消',style: TextStyle(color: Colors.black),)),
              new CupertinoButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('确认')),
            ],
          );
        });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void didUpdateWidget(DialogDemo oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}
