import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.





  @override
  Widget build(BuildContext context) {

    print("www");
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }

  MyApp(){

    print("init  ");
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;



  @override
  _MyHomePageState createState(){
    print("createState  ");
    return  _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    super.initState();

    print("initstate");
  }
  @override
  Widget build(BuildContext context) {
    print("_MyHomePageState");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
