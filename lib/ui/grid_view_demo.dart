import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/model/ChatRoomMember.dart';
import 'package:flutter_app_demo/r.dart';

import '../color.dart';

class GridViewDemo extends StatefulWidget {
  List<ChatRoomMember> allChatList;

  @override
  _GridViewDemoState createState() {
    return _GridViewDemoState();
  }

  GridViewDemo(this.allChatList);
}

class _GridViewDemoState extends State<GridViewDemo> {
  List<ChatRoomMember> currentList = new List();
  bool isSHowMore = true;
  bool isMoreClickState = false;
  String showText = "查看更多群成员";
  @override
  void initState() {
    //    初始化数据
    if (widget.allChatList.length >= 10) {
      //取10个 同时显示加载更多控件
      currentList = widget.allChatList.sublist(0, 8);
      isSHowMore = false;
    } else {
      currentList = widget.allChatList;
      isSHowMore = true;
    }

    currentList
        .add(ChatRoomMember(wechatId: "add", nickname: "", avatar: "add"));

    currentList
        .add(ChatRoomMember(wechatId: "", nickname: "", avatar: "subtract"));
    super.initState();
  }

  onHeaderClick() {}

  onMoreClick() {
    if (!isMoreClickState) {
      setState(() {
        isMoreClickState = true;
        showText = "收起";
        currentList = widget.allChatList;
        currentList.add(
            ChatRoomMember(wechatId: "", nickname: "", avatar: "subtract"));
      });
    } else {
      setState(() {
        isMoreClickState = false;
        showText = "查看更多群成员";
        currentList = widget.allChatList; //.sublist(0, 8);
        currentList
            .add(ChatRoomMember(wechatId: "add", nickname: "", avatar: "add"));

        currentList.add(
            ChatRoomMember(wechatId: "", nickname: "", avatar: "subtract"));
        isSHowMore = false;
      });
    }
  }

  Widget buildGridViewItemWidget(ChatRoomMember member) {
    return GestureDetector(
      onTap: () {
        onHeaderClick();
      },
      child: Container(
          child: Column(
        children: <Widget>[
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(25.0),
              ),
              border: new Border.all(
                  width: 0.1, color: Color(AppColor.groupTextColor)),
            ),
            child: ClipOval(
              child: SizedBox(
                child: CachedNetworkImage(
                  imageUrl: member.avatar,
                  placeholder: (context, url) => SizedBox(
                        width: 25,
                        height: 25,
                        child: CircularProgressIndicator(),
                      ),
                  errorWidget: (context, url, error) => new Icon(Icons.error),
                ),
              ),
            ),
          ),
          Text(
            member.nickname,
            style: TextStyle(
              color: Color(AppColor.groupTextColor),
            ),
          ),
        ],
      )),
    );
  }

  Widget buildMoreWidget() {
    return FlatButton(
      onPressed: () {
        onMoreClick();
      },
      child: Text(
        showText,
        style: TextStyle(fontSize: 17, color: Color(AppColor.groupTextColor)),
      ),
    );
  }

  GridView buildGridView() {
    return GridView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 80, //子控件最大宽度为100
        childAspectRatio: 1, //宽高比为
        //            crossAxisSpacing: 15,
        mainAxisSpacing: 10,
      ),
      padding: EdgeInsets.all(10),
      children: List.generate(
        currentList.length,
        (index) {
          var member = currentList.elementAt(index);
          return buildGridViewItemWidget(member);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            buildGridView(),
            Offstage(offstage: isSHowMore, child: buildMoreWidget()),
          ],
        ),
      ),
    );
  }
}
