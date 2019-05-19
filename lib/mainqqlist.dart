import 'package:flutter/material.dart';
import 'package:flutter_app_demo/ToastView.dart';

void main() => runApp(MyApp());
//类似qq聊天列表界面
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
  //itemView
  Widget getItemView(int postion) {
    print(postion);
    return new ListTile(
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          print("wilson 点击的数据");
          print(postion);
        }));
      },
      leading: new CircleAvatar(
        radius: 20.0,
        backgroundImage: new NetworkImage(
            'https://upload.jianshu.io/users/upload_avatars/7700793/dbcf94ba-9e63-4fcf-aa77-361644dd5a87?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
      ),
      title: new Text("班主任"),
      subtitle: new Text("你高考考了满分你知道吗？"),
      trailing: new Container(
        child: Column(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.fromLTRB(0, 12, 5, 0),
              child: Text(

                "9:00",
                style: TextStyle(fontSize: 12),
              ),
            ),
            new Container(
              margin: EdgeInsets.fromLTRB(0, 2, 5, 0),
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), //圆角
                color: Colors.red, //圆点背景颜色
              ),
              child: new Text(
                "1",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

//  //itemView
//  Widget getItemView(int postion) {
//    print(postion);
//    return new ListTile(
//
//      onTap: () {
//        print("wilson 点击的数据");
//      },
//      leading: new CircleAvatar(
//        radius: 20.0,
//        backgroundImage: new NetworkImage(
//            'https://upload.jianshu.io/users/upload_avatars/7700793/dbcf94ba-9e63-4fcf-aa77-361644dd5a87?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
//      ),
//      title: new Text("班主任"),
//      trailing: new Container(
//        decoration: BoxDecoration(
//           color: Color(0xff888888),  //登录状态颜色Color(0xff08BB07),
//           borderRadius: BorderRadius.all(Radius.circular(10))
//        ),
//        child: new Text("    "),
//      ),
//
//    );
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[getItemView(1)],
        ),
      ),
    );
  }
}
