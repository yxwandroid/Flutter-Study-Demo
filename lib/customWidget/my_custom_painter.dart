import 'dart:ui';
import 'dart:ui' as ui show TextStyle;

import 'package:flutter/material.dart';

class BaseData {
  String name;
  int num;

  BaseData({this.name, this.num});
}

class MyCustomPainter extends CustomPainter {
  //绘制区域宽度
  final int width = 300;

  //绘制区域高度
  final int height = 350;

  //坐标原点
  final Offset origin = const Offset(50.0, 280.0);

  //纵坐标顶点
  final Offset vertexVer = const Offset(50.0, 20.0);

  //横坐标顶点
  final Offset vertexHor = const Offset(300.0, 280.0);

  //纵坐标刻度间隔
  final int scaleInterval = 1000;

  const MyCustomPainter(this.data);

  final List<BaseData> data;

  //根据文本内容和字体大小等构建一段文本
  Paragraph buildParagraph(String text, double textSize, double constWidth) {
    ParagraphBuilder builder = ParagraphBuilder(
      ParagraphStyle(
        textAlign: TextAlign.right,
        fontSize: textSize,
        fontWeight: FontWeight.normal,
      ),
    );
    builder.pushStyle(ui.TextStyle(color: Colors.black));
    builder.addText(text);
    ParagraphConstraints constraints = ParagraphConstraints(width: constWidth);
    return builder.build()..layout(constraints);
  }

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0
      ..strokeCap = StrokeCap.square;

    //绘制纵坐标轴线
    canvas.drawLine(origin, vertexVer, paint);
    canvas.drawLine(
        vertexVer, Offset(vertexVer.dx - 5, vertexVer.dy + 10), paint);
    canvas.drawLine(
        vertexVer, Offset(vertexVer.dx + 5, vertexVer.dy + 10), paint);
    canvas.drawParagraph(
        buildParagraph('印刷量', 14, origin.dx - 5), Offset(0, vertexVer.dy - 8));

    //绘制横坐标轴线
    canvas.drawLine(origin, vertexHor, paint);
    canvas.drawLine(
        vertexHor, Offset(vertexHor.dx - 10, vertexHor.dy - 5), paint);
    canvas.drawLine(
        vertexHor, Offset(vertexHor.dx - 10, vertexHor.dy + 5), paint);
    canvas.drawParagraph(buildParagraph('书籍名', 14, origin.dx - 5),
        Offset(vertexHor.dx, origin.dy + 8));

    //绘制纵坐标刻度
    //实际最大值
    double realMaxY = origin.dy - vertexVer.dy - 20;
    //刻度间隔实际值
    double scaleInte = realMaxY / 5;
    for (int i = 0; i < 5; i++) {
      canvas.drawLine(Offset(origin.dx, origin.dy - (i + 1) * scaleInte),
          Offset(origin.dx + 5, origin.dy - (i + 1) * scaleInte), paint);
      canvas.drawParagraph(
          buildParagraph(
              ((i + 1) * scaleInterval).toString(), 12, origin.dx - 5),
          Offset(0, origin.dy - (i + 1) * scaleInte - 8.0));
    }

    if (data == null || data.length == 0) {
      return;
    }
    //计算纵坐标上的刻度
    int size = data.length;
    //柱状图间隔值
    double horiScalInte = (vertexHor.dx - origin.dx - 20) / size;
    //柱状图宽
    double chartWidth = 5;
    for (int i = 0; i < size; i++) {
      BaseData curData = data[i];
      double valueY = curData.num * scaleInte / scaleInterval;
      canvas.drawRect(
          Rect.fromLTWH(origin.dx + (i + 1) * horiScalInte, origin.dy - valueY,
              chartWidth, valueY),
          paint);
      canvas.drawParagraph(buildParagraph(curData.name, 12, origin.dx - 5),
          Offset(origin.dx + (i + 1) * horiScalInte - 25, origin.dy + 8));
    }
  }

  @override
  bool shouldRepaint(MyCustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate.data != data;
  }
}
