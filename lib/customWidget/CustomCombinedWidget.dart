import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCombinedWidget extends StatefulWidget {

  final IconData iconData;
  final String title;
  final GestureTapCallback onTap;

  const CustomCombinedWidget({Key key, this.iconData, this.title, this.onTap}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomCombinedWidgetState();
  }

}

class CustomCombinedWidgetState extends State<CustomCombinedWidget> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: this.widget.onTap,
      child: Column(
        children: <Widget>[
          Icon(this.widget.iconData, size: 45.0,),
          Text(this.widget.title == null ? "" : this.widget.title, style: TextStyle(fontSize: 14.0, color: Colors.black),),
        ],
      ),
    );
  }

}

