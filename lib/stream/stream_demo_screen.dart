
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/stream/stream_singleton.dart';
import 'package:flutter_app_demo/utils/toast.dart';

class StreamDemoScreen extends StatefulWidget {
  @override
  StreamDemoScreenState createState() => new StreamDemoScreenState();
}

///参考https://juejin.im/post/5cc2acf86fb9a0321f042041
class StreamDemoScreenState extends State<StreamDemoScreen> {

  ///事件订阅对象
  StreamSubscription _dataSubscription;

  @override
  void initState() {
    super.initState();
    _dataSubscription= StreamSingleton.getInstance.getStrem.listen((value){
      print(value);
      ToastUtil.showToast(value);
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: InkWell(
          onTap: (){
          },
          child: Text("回调的值显示"),
        ),
      ),
      body: FlatButton(onPressed: (){
        StreamSingleton.getInstance.addInfo();
      }, child: Text("stream ")),
    );
  }

//  dispose
  @override
  void dispose() {
    _dataSubscription.cancel();
    StreamSingleton.getInstance.close();

    super.dispose();
  }


}
