import 'package:flutter/material.dart';

//http://flutter.link/2018/04/12/Dart%E4%B8%AD%E7%9A%84%E5%BC%82%E6%AD%A5%E6%93%8D%E4%BD%9C/
class AsyncScreen extends StatefulWidget {
  @override
  _AsyncScreenState createState() => _AsyncScreenState();
}

class _AsyncScreenState extends State<AsyncScreen> {
  @override
  void initState() {
    super.initState();
  }

  String enterRestaurant() {
    return "和朋友进入了一家餐馆";
  }

  String waitForDinner() {
    return "我们的菜来了，我要开始吃饭了";
  }

  String startChat() {
    return "我们朋友聊起家常";
  }

  String playPhone() {
    return "等了好好久了，我还是玩会手机吧";
  }

  @override
  Widget build(BuildContext context) {
//
//    print(enterRestaurant());
//    print(waitForDinner());
//    print(startChat());
//    print(playPhone());

    print(enterRestaurant());
    Future<String> waitDinnerFuture = new Future(waitForDinner);
    waitDinnerFuture.then((str) {
      print(str);
    });
    print(startChat());
    print(playPhone());

    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter异步使用"),
      ),
      body: Container(
        child: Text("详细内容看代码"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
