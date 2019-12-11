import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ExpandableListViewScreen extends StatefulWidget {

  const ExpandableListViewScreen({Key key}) : super(key: key);

  @override
  _ExpandableListViewScreenState createState() =>
      new _ExpandableListViewScreenState();
}

class _ExpandableListViewScreenState extends State<ExpandableListViewScreen> {
  bool expandFlag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("expandableListView使用"),
      ),
      body: new Container(
        margin: new EdgeInsets.symmetric(vertical: 1.0),
        child: new Column(
          children: <Widget>[
            new Container(
              color: Colors.white,
              padding: new EdgeInsets.symmetric(horizontal: 5.0),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: new Text(
                      "expandableListView使用",
                      style: new TextStyle(color: Colors.black),
                    ),
                  ),
                  new IconButton(
                      icon: new Container(
                        height: 50.0,
                        width: 50.0,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: new Center(
                          child: new Icon(
                            expandFlag
                                ? Icons.keyboard_arrow_up
                                : Icons.keyboard_arrow_down,
                            color: Colors.black,
                            size: 30.0,
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          expandFlag = !expandFlag;
                        });
                      })
                ],
              ),
            ),
            new ExpandableContainer(
                expanded: expandFlag,
                count: 300,
                child: new ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return new Container(
                      decoration: new BoxDecoration(
                          border: new Border.all(width: 0.5, color: Colors.grey),
                          color: Colors.white),
                      child: new ListTile(
                        title: new Text(
                          "Cool $index",
                          style: new TextStyle(color: Colors.black),
                        ),
                        leading: new ClipOval(
                          child: CachedNetworkImage(
                            width: 40,
                            height: 40,
                            imageUrl:
                                "http://wx.qlogo.cn/mmhead/ver_1/PkR2ictNRnb7pX0iaUuBaibUWqBk193lcAxGrWt5IQhRZicI55PiaHmSicHwyEbz6NATv6gvFIgxS2InveZGaQFkEuUbnX8CiaWQa9ibiasXwOxWtDicg/0",
                            placeholder: (context, url) =>
                                new CircularProgressIndicator(
                              strokeWidth: 1,
                            ),
//          errorWidget: (context, url, error) => new Image.asset(
//                R.,
//                width: 40,
//                height: 40,
//              ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: 300,
                ))
          ],
        ),
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final double collapsedHeight;
  final double expandedHeight;
  final int count;
  final Widget child;

  ExpandableContainer({
    @required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 500.0,
    this.count = 10,
    this.expanded = true,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return new AnimatedContainer(
      duration: new Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? screenHeight - 200 : collapsedHeight,
      child: new Container(
        child: child,
        decoration: new BoxDecoration(
            border: new Border.all(
          width: 0.5,
          color: Color(0xfff5f7f9),
        )),
      ),
    );
  }
}
