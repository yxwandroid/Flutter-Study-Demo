import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/widget/net_loading_dalog.dart';

class DialogDemoScreen extends StatefulWidget {
  static enter(BuildContext context) {
    return Navigator.push(context, MaterialPageRoute(
        builder: (BuildContext content) => DialogDemoScreen()));
  }

  @override
  DialogDemoScreenState createState() => new DialogDemoScreenState();
}

class DialogDemoScreenState extends State<DialogDemoScreen> {

  var _groupTextFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(title: FlatButton(onPressed: () {
    }, child: new Text('对话框')),),
      body: Container(child: Center(
        child: Column(children: <Widget>[FlatButton(onPressed: () {
          showAndroidAlertDialog(context);
        }, child: Text("Android 风格 对话框")), FlatButton(onPressed: () {
          showMySimpleDialog(context);
        }, child: Text("android 风格 对话框")), FlatButton(onPressed: () {
          _displayDialog();
        }, child: Text("IOS 风格输入框")), FlatButton(onPressed: () {
          showAlertDialog(context);
        }, child: Text("IOS  对话框")), FlatButton(onPressed: () {
          showErrorAlertDialog(context);
        }, child: Text("IOS  对话框")),

          FlatButton(onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return new NetLoadingDialog(
                    loadingText: "加载中",
                    dismissDialog: _disMissCallBack,
                    outsideDismiss: false,
                  );
                }
            );

          }, child: Text("net loading dalog")),

        ],),),),);
  }




  //这个func 就是关闭Dialog的方法，在适当的时候关闭即可
  _disMissCallBack(Function func) {
    new Future.delayed(const Duration(milliseconds: 1500), () =>
        Navigator.of(context).pop(true));
  }

  void showAndroidAlertDialog(BuildContext context) {
    showDialog(context: context, builder: (_) =>
    new AlertDialog(content: Container(height: 100,
        child: Column(children: <Widget>[
          Container(margin: EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[

              new Text("价格可以优惠吗!"),
            ],),),
          Container(margin: EdgeInsets.only(top: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new FlatButton(child: new Text("取消"), onPressed: () {
                  Navigator.of(context).pop();
                },),
                new FlatButton(child: new Text("预览"), onPressed: () {
                  Navigator.of(context).pop();
                },),
                new FlatButton(child: new Text("发送"), onPressed: () {
                  Navigator.of(context).pop();
                },),
              ],),),
        ],)),));
  }

  Future<void> showAlertDialog(context) async {
    return showDialog<Null>(
        context: context, barrierDismissible: true, builder: (context) {
      return new Center(child: new CupertinoAlertDialog(
        content: new SingleChildScrollView(child: ListBody(children: <Widget>[
          new Column(children: <Widget>[
            new Container(//new EdgeInsets.fromLTRB(20, 100.0, 20, 0),
              //                      margin: new EdgeInsets.fromLTRB(0, 0.0, 0, 20),
              width: 50,
              height: 50,
              child: Image.asset("images/verify_code_su.png"),),
            new Text("xxx", style: new TextStyle(color: Color(0xff898996),),)
          ],),
          new Container(margin: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
            child: Text("xxx:"),),
          new Container(margin: new EdgeInsets.fromLTRB(0, 10.0, 0, 0),
            child: Text("xxxx", style: TextStyle(fontSize: 17,),),),
        ],),),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text("返回重试", style: TextStyle(color: Color(0xff181830)),),
            onPressed: () {
              print("取消");
              Navigator.of(context).pop();
            },),
          CupertinoDialogAction(child: Text("确定登录"), onPressed: () {
            print("确定");
            Navigator.of(context).pop();
          },),
        ],),);
    });
  }

  Future<void> showErrorAlertDialog(context) async {
    return showDialog<Null>(
        context: context, barrierDismissible: true, builder: (context) {
      return new Center(child: new CupertinoAlertDialog(
        content: new SingleChildScrollView(child: ListBody(children: <Widget>[
          new Column(children: <Widget>[
            new Container(width: 50,
              height: 50,
              child: Image.asset("images/verify_code_err.png"),),
            new Text("xxx", style: new TextStyle(color: Color(0xff898996),),)
          ],),
        ],),),
        actions: <Widget>[
          CupertinoDialogAction(child: Text("返回重试",), onPressed: () {
            print("取消");
            Navigator.of(context).pop();
          },),
        ],),);
    });
  }

  void showMySimpleDialog(BuildContext context) {
    showDialog(context: context, builder: (context) {
      return new SimpleDialog(title: new Text("SimpleDialog"),
        children: <Widget>[
          new SimpleDialogOption(
            child: new Text("SimpleDialogOption One"), onPressed: () {
            Navigator.of(context).pop("SimpleDialogOption One");
          },),
          new SimpleDialogOption(
            child: new Text("SimpleDialogOption Two"), onPressed: () {
            Navigator.of(context).pop("SimpleDialogOption Two");
          },),
          new SimpleDialogOption(
            child: new Text("SimpleDialogOption Three"), onPressed: () {
            Navigator.of(context).pop("SimpleDialogOption Three");
          },),
        ],);
    });
  }

  Future<void> _displayDialog() async {
    return showDialog<void>(context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(content: Material(child: Container(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(bottom: 20), child: Text('打招呼',

                    style: TextStyle(color: Colors.black, fontSize: 18),),),
                  Container(width: 250,
                    decoration: BoxDecoration(border: Border.all(
                        color: Color(0xffF2F2F2), width: 0.1),
                        borderRadius: BorderRadius.all(Radius.circular(0.1))),
                    child: TextField(maxLines: 3,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                              left: 10, top: 10, right: 10, bottom: 10),
                          border: OutlineInputBorder(// borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide(color: Colors.white))),
                      controller: _groupTextFieldController,),),
                ],)),), actions: <Widget>[
            new CupertinoButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: Text('取消', style: TextStyle(color: Colors.black),)),
            new CupertinoButton(onPressed: () {
              Navigator.of(context).pop();
            }, child: Text('确认')),
          ],);
        });
  }

  @override
  void initState() {
    super.initState();
  }

}
