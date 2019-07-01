import 'package:flutter/material.dart';
import 'package:flutter_app_demo/image/dragscale_screen.dart';
import 'package:flutter_app_demo/utils/route_helper.dart';
import 'package:flutter_drag_scale/core/drag_scale_widget.dart';

class ImageDemoScreen extends StatefulWidget {
  @override
  _ImageDemoScreenState createState() {
    return _ImageDemoScreenState();
  }
}

class _ImageDemoScreenState extends State<ImageDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("image的各种操作"),),
      body: ListView(
        children: <Widget>[
          FlatButton(child: Text("图片的放大和缩小"),onPressed: (){

            RouteHelper.pushWidget(context, DragScaleDemoScreen());
          },)
        ],
      ),
    );;
  }
}