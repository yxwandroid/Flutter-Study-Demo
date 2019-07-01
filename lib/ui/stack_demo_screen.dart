import 'package:flutter/material.dart';



class StackDemoScreen extends StatefulWidget {


  @override
  StackDemoScreenState createState() => StackDemoScreenState();
}

class StackDemoScreenState extends State<StackDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("stack 控件使用"),
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
