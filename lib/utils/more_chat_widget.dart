import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MoreChatWidget extends StatefulWidget {
  var func;
  MoreChatWidget(this.func);

  @override
  State<MoreChatWidget> createState() {
    return MoreWidgetState();
  }
}

//onTap: widget.onTap,

class MoreWidgetState extends State<MoreChatWidget> {
  Map<String,String> icoPath = new Map();
  List<Widget> icoWidget = new List();
  @override
  void initState() {
    super.initState();
    icoPath["照片"] = "images/photo_ico.png";
    icoPath["相机"] = "images/camera_ico.png";
    icoPath["素材"] = "images/material_ico.png";
    icoPath["转接"] = "images/transfer_ico.png";
    icoPath["文件"] = "images/file_ico.png";

    getAllWidget();
  }

  getAllWidget() {
    icoPath.forEach((key, value) {
      Widget item = getItem(key, value);
      icoWidget.add(item);
    });
  }

  Widget getItem(String icoName ,String imagePath) {
    Widget item = GestureDetector(
      onTap: () {
        this.widget.func(icoName);
      },
      child:Column(children: <Widget>[
        ClipOval(
          child: Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(10),
            color:Color(0xff2DA8F7),
            child: Image.asset(
              imagePath,
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Text(icoName)


      ],),
    );
    return item;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.all(20),
      height: 200,
      color: Color(0xffF8F8FA),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 30,
          runSpacing: 30,
          children: icoWidget,
        ),
      ),
    );
  }
}
