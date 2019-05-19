import 'package:flutter/material.dart';

import 'my_custom_painter.dart';

class CustomPainterPage extends StatefulWidget {
  @override
  CustomPainterPageState createState() => new CustomPainterPageState();
}

class CustomPainterPageState extends State<CustomPainterPage> {
  List<BaseData> data = List();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义绘制Widget'),
      ),
      body: Container(
        child: buildDemoPaintWidget(),
      ),
    );
  }

  Widget buildDemoPaintWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          height: 350,
          child: buildPaintWidget(),
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              MaterialButton(
                onPressed: () {
                  BaseData book1 = BaseData(name: '书籍A', num: 5000);
                  BaseData book2 = BaseData(name: '书籍B', num: 2000);
                  BaseData book3 = BaseData(name: '书籍C', num: 3000);
                  List<BaseData> dataList = List();
                  dataList.add(book1);
                  dataList.add(book2);
                  dataList.add(book3);
                  setState(() {
                    this.data = dataList;
                  });
                },
                child: Text('三本书'),
              ),
              MaterialButton(
                onPressed: () {
                  BaseData book4 = BaseData(name: '书籍D', num: 4500);
                  setState(() {
                    this.data.add(book4);
                  });
                },
                child: Text('四本书'),
              ),
              MaterialButton(
                onPressed: () {
                  BaseData book5 = BaseData(name: '书籍E', num: 2500);
                  setState(() {
                    this.data.add(book5);
                  });
                },
                child: Text('五本书'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //构建自定义绘制的Widget
  Widget buildPaintWidget() {
    return CustomPaint(
      painter: MyCustomPainter(data),
    );
  }
}
