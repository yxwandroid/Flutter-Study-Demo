import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData.dark(),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State createState() => new MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> showAlertDialog(context) async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return new Center(
            child: new CupertinoAlertDialog(
              content: new SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new Container(
                          //new EdgeInsets.fromLTRB(20, 100.0, 20, 0),
//                      margin: new EdgeInsets.fromLTRB(0, 0.0, 0, 20),
                          width: 50,
                          height: 50,
                          child: Image.asset("images/verify_code_su.png"),
                        ),
                        new Text(
                          "秘钥验证成功",
                          style: new TextStyle(
                            color: Color(0xff898996),
                          ),
                        )
                      ],
                    ),
                    new Container(
                      margin: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                      child: Text("你即将登录:"),
                    ),
                    new Container(
                      margin: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
                      child: Text(
                        "上海奥创客维科技有限公司",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(
                    "返回重试",
                    style: TextStyle(color: Color(0xff181830)),
                  ),
                  onPressed: () {
                    print("取消");
                    Navigator.of(context).pop();
                  },
                ),
                CupertinoDialogAction(
                  child: Text("确定登录"),
                  onPressed: () {
                    print("确定");
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  Future<void> showErrorAlertDialog(context) async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (context) {
          return new Center(
            child: new CupertinoAlertDialog(
              content: new SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new Container(
                          width: 50,
                          height: 50,
                          child: Image.asset("images/verify_code_err.png"),
                        ),
                        new Text(
                          "秘钥验证失败",
                          style: new TextStyle(
                            color: Color(0xff898996),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  child: Text(
                    "返回重试",
                  ),
                  onPressed: () {
                    print("取消");
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  void showMySimpleDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return new SimpleDialog(
            title: new Text("SimpleDialog"),
            children: <Widget>[
              new SimpleDialogOption(
                child: new Text("SimpleDialogOption One"),
                onPressed: () {
                  Navigator.of(context).pop("SimpleDialogOption One");
                },
              ),
              new SimpleDialogOption(
                child: new Text("SimpleDialogOption Two"),
                onPressed: () {
                  Navigator.of(context).pop("SimpleDialogOption Two");
                },
              ),
              new SimpleDialogOption(
                child: new Text("SimpleDialogOption Three"),
                onPressed: () {
                  Navigator.of(context).pop("SimpleDialogOption Three");
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Example App')),
      body: new Center(
        child: new RaisedButton(onPressed: () {
//          showMySimpleDialog(context);
          showErrorAlertDialog(context);
        }),
      ),
    );
  }
}
