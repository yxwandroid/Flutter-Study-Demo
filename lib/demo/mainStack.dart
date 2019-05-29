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
      body: Container(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            new CircleAvatar(
              backgroundImage: AssetImage("assets/images/img.jpg"),
            ),
            Positioned(
                top: 0.0,
                right: 1,
                child: new Container(
                  width: 15,
                  height:15,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: new Border.all(width: 1.0,color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(10))),

                  child: Text(
                    "    ",
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
