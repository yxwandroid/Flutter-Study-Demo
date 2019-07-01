import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ChatItemView extends StatefulWidget {
  ChatItemView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  ChatItemViewState createState() => ChatItemViewState();
}

class ChatItemViewState extends State<ChatItemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            buildChatLeftPersonCard(),
            buildChatRightPersonCard(),
          ],
        ),
      ),
    );
  }



  ///聊天左侧名片界面
  static Widget buildChatLeftLink() {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, //对齐方式，左上对齐
        children: <Widget>[
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                "http://wx.qlogo.cn/mmhead/ver_1/FZ0fjE2j90X9odJRXAuMaxuPnBfsvM4z8OIRLEJfmmJtwpO2E2B0JxMFibSlvhfZ8w83gfCvvPxPtBqWicppyuj2nRO5wufuxnhlZS8riaYnFQ/0"),
            radius: 20.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 5.0, right: 0, top: 0),
            child: Container(
              width: 150,
              height: 90,
              decoration: BoxDecoration(
                //设置背景
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin:EdgeInsets.only(left: 10,top: 5),
                      child: Text("个人名片")),
                  Container(
                    width: 130,
                    height: 0.5,
                    color: Colors.black,
                    margin:EdgeInsets.only(left: 10,top: 5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child:  CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                                "http://wx.qlogo.cn/mmhead/ver_1/FZ0fjE2j90X9odJRXAuMaxuPnBfsvM4z8OIRLEJfmmJtwpO2E2B0JxMFibSlvhfZ8w83gfCvvPxPtBqWicppyuj2nRO5wufuxnhlZS8riaYnFQ/0"),
                            radius: 20.0,
                          )
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                        child:Text("wilson"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  ///聊天左侧名片界面
  static Widget buildChatLeftPersonCard() {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, //对齐方式，左上对齐
        children: <Widget>[
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                "http://wx.qlogo.cn/mmhead/ver_1/FZ0fjE2j90X9odJRXAuMaxuPnBfsvM4z8OIRLEJfmmJtwpO2E2B0JxMFibSlvhfZ8w83gfCvvPxPtBqWicppyuj2nRO5wufuxnhlZS8riaYnFQ/0"),
            radius: 20.0,
          ),
          Container(
            margin: const EdgeInsets.only(left: 5.0, right: 0, top: 0),
            child: Container(
              width: 150,
              height: 90,
              decoration: BoxDecoration(
                //设置背景
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin:EdgeInsets.only(left: 10,top: 5),
                      child: Text("个人名片")),
                  Container(
                    width: 130,
                    height: 0.5,
                    color: Colors.black,
                    margin:EdgeInsets.only(left: 10,top: 5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child:  CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                                "http://wx.qlogo.cn/mmhead/ver_1/FZ0fjE2j90X9odJRXAuMaxuPnBfsvM4z8OIRLEJfmmJtwpO2E2B0JxMFibSlvhfZ8w83gfCvvPxPtBqWicppyuj2nRO5wufuxnhlZS8riaYnFQ/0"),
                            radius: 20.0,
                          )
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                        child:Text("wilson"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


  ///聊天右侧名片界面
  static Widget buildChatRightPersonCard() {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        //对齐方式，左上对齐
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start, //对齐方式，左上对齐
        children: <Widget>[

          Container(
            margin: const EdgeInsets.only(left: 5.0, right: 0, top: 0),
            child: Container(
              width: 150,
              height: 90,
              decoration: BoxDecoration(
                //设置背景
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin:EdgeInsets.only(left: 10,top: 5),
                      child: Text("个人名片")),
                  Container(
                    width: 130,
                    height: 0.5,
                    color: Colors.black,
                    margin:EdgeInsets.only(left: 10,top: 5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          width: 50,
                          height: 50,
                          margin: EdgeInsets.fromLTRB(10, 5, 0, 0),
                          child:  CircleAvatar(
                            backgroundImage: CachedNetworkImageProvider(
                                "http://wx.qlogo.cn/mmhead/ver_1/FZ0fjE2j90X9odJRXAuMaxuPnBfsvM4z8OIRLEJfmmJtwpO2E2B0JxMFibSlvhfZ8w83gfCvvPxPtBqWicppyuj2nRO5wufuxnhlZS8riaYnFQ/0"),
                            radius: 20.0,
                          )
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 25, 0),
                        child:Text("wilson"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          CircleAvatar(
            backgroundImage: CachedNetworkImageProvider(
                "http://wx.qlogo.cn/mmhead/ver_1/FZ0fjE2j90X9odJRXAuMaxuPnBfsvM4z8OIRLEJfmmJtwpO2E2B0JxMFibSlvhfZ8w83gfCvvPxPtBqWicppyuj2nRO5wufuxnhlZS8riaYnFQ/0"),
            radius: 20.0,
          ),
        ],
      ),
    );
  }




}
