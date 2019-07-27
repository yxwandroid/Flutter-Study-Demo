import 'package:flutter/material.dart';

enum PopupType { copy, forward, withdraw }
class CoustmPopuWindow extends StatefulWidget {

  final Function callBack;

  const CoustmPopuWindow({Key key, this.callBack}) : super(key: key);
  @override
  CoustmPopuWindowState createState() => new CoustmPopuWindowState();
}

class CoustmPopuWindowState extends State<CoustmPopuWindow> {
  @override
  Widget build(BuildContext context) {
    return buildWidget();
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  Widget buildWidget() {

    return Container(
      decoration:
      BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: buildCustomPaint(),
          ),
          buildRow(),
        ],
      ),
    );
  }

  CustomPaint buildCustomPaint() {
    List leftSpots = new List(3);
    leftSpots[0] = Coordinates(cx: 0, cy: -5);
    leftSpots[1] = Coordinates(cx: -5, cy: 0);
    leftSpots[2] = Coordinates(cx: 5, cy: 0);
    return CustomPaint(
      painter: new TriangleCustomPainter(context, leftSpots,
          color: Colors.black),
    );
  }

  Widget buildRow() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(6))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: GestureDetector(
              onTap: (){
                widget.callBack(PopupType.copy);
              },
              child: Text(
                "复制",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            width: 0.5,
            height: 15,
            color: Colors.white,
          ),
          GestureDetector(
            onTap: (){
              widget.callBack(PopupType.forward);
            },
            child: Text(
              "转发",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 15, right: 15),
            width: 0.5,
            height: 15,
            color: Colors.white,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: (){
                widget.callBack(PopupType.withdraw);
              },
              child: Text(
                "撤回",
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }


}


class Coordinates {
  double cx;
  double cy;
  Coordinates({this.cx, this.cy});
}

class TriangleCustomPainter extends CustomPainter {
  Paint _paint = new Paint(); //画笔富含各种属性方法。仔细查看源码
  final BuildContext context;
  final List spots;
  final Color color;

  TriangleCustomPainter(this.context, this.spots, {this.color});

  @override
  void paint(Canvas canvas, Size size) {
    Path path = new Path();
    path.moveTo(spots[0].cx, spots[0].cy);
    path.lineTo(spots[1].cx, spots[1].cy);
    path.lineTo(spots[2].cx, spots[2].cy);
    _paint.style = PaintingStyle.fill;
    _paint.color = color;
    canvas.drawPath(path, _paint);
    //    canvas.drawPath(path, _paint = PaintingStyle.fill,color = color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
