import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/utils/toast.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notification 使用"),
        ),
        body: NotificationListener(
          onNotification: (notification) {
            setState(() {
              ToastUtil.showToast("上级接到了通知");
            });
            return true;
          },
          child: new RaisedButton(
              textColor: Colors.black,
              child: new Center(
                child: new Text('点击传递随机数给上层Widget'),
              ),
              onPressed: () {
                new TestNotification(count: new Random().nextInt(100))
                    .dispatch(context);
              }),
        ));
  }
}

class TestNotification extends Notification {
  TestNotification({
    @required this.count,
  });

  final int count;
}
