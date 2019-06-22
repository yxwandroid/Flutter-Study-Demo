import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app_demo/stream/record_stream.dart';

class CallBackDemo extends StatefulWidget {
  @override
  CallBackDemoState createState() => new CallBackDemoState();
}

class CallBackDemoState extends State<CallBackDemo> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: InkWell(
          onTap: (){
            RecordStream.getInstance.addInfo();
          },
          child: Text('text'),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


}
