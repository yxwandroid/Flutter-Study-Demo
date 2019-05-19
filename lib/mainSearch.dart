import 'package:flutter/material.dart';
import 'package:flutter_app_demo/ToastView.dart';

void main() => runApp(MyApp());

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(

        child: new Container(
          height: 35 ,
          margin: const EdgeInsets.all(10.0),
//          padding: const EdgeInsets.all(10.0),
          decoration:  new BoxDecoration(
//            border: new Border.all(width: 1.0,color: Colors.grey),
            color: Color(0xffF5F7F9),
            borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(

                width: 15,
                height: 15,
                child: Image.asset("images/search.png"),
              ),
              Text(
                '昵称/备注/标签 #F5F7F9',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
