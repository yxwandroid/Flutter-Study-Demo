import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/model/chat_room_member.dart';
import 'package:flutter_app_demo/r.dart';
import '../color.dart';

class GridViewDemoScreen extends StatefulWidget {
  static final String sName = "GridViewDemoScreen";
  static enter(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext content) => GridViewDemoScreen()));
  }

  @override
  _GridViewDemoScreenState createState() {
    return _GridViewDemoScreenState();
  }

  GridViewDemoScreen();
}


List<ChatRoomMember> allChatList = [
  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/images/WechatIMG1.jpeg"),
  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/images/WechatIMG1.jpeg"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/images/WechatIMG1.jpeg"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/images/WechatIMG1.jpeg"),
  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/images/WechatIMG1.jpeg"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/images/WechatIMG1.jpeg"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/images/WechatIMG1.jpeg"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/images/WechatIMG1.jpeg"),
  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/images/WechatIMG1.jpeg"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/images/WechatIMG1.jpeg"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/images/WechatIMG1.jpeg"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/images/WechatIMG1.jpeg"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/images/WechatIMG1.jpeg"),




];

class _GridViewDemoScreenState extends State<GridViewDemoScreen> {
  List<ChatRoomMember> currentList = new List();
  List<ChatRoomMember> allList = new List();
  bool isSHowMore = true;
  bool isMoreClickState = false;
  String showText = "查看更多群成员";
  @override
  void initState() {
    initView();
  }

  initView(){
    allList = allChatList;
    //    初始化数据
    if (allList.length >= 10) {
      //取10个 同时显示加载更多控件
      currentList = allList.sublist(0, 8);
      isSHowMore = false;
    } else {
      currentList = allList;
      isSHowMore = true;
    }
    currentList.add(ChatRoomMember(wechatId: "", nickname: "", avatar: R.imagesGroupAddIco));
    currentList.add(ChatRoomMember(wechatId: "", nickname: "", avatar: R.imagesGroupDeleteIco));
    super.initState();
  }

  onHeaderClick() {}

  onMoreClick() {
    if (!isMoreClickState) {
      setState(() {
        isMoreClickState = true;
        showText = "收起";
        currentList.clear();
        allList.forEach((item){
          currentList.add(item);
        });

      });
    } else {
      setState(() {
        isMoreClickState = false;
        showText = "查看更多群成员";
        currentList = allList.sublist(0, 8);

        isSHowMore = false;
      });
    }
    currentList.add(ChatRoomMember(wechatId: "", nickname: "", avatar: R.imagesGroupAddIco));
    currentList.add(ChatRoomMember(wechatId: "", nickname: "", avatar: R.imagesGroupDeleteIco));
  }



  ClipOval buildDelete(ChatRoomMember member) {
    return ClipOval(child: SizedBox(child: Image.asset(member.avatar),),);
  }

  ClipOval buildAdd(ChatRoomMember member) {
    return ClipOval(child: SizedBox(child: Image.asset(member.avatar),),);
  }

  ClipOval buildAvatar(ChatRoomMember member) {
    return ClipOval(child: SizedBox(child: CachedNetworkImage(
      imageUrl: member.avatar,
      placeholder: (context, url) =>
          SizedBox(width: 25, height: 25, child: CircularProgressIndicator(),),
      errorWidget: (context, url, error) => new Icon(Icons.error),),),);
  }

  ClipOval buildClipOval(ChatRoomMember member) {
    if (member.avatar == R.imagesGroupAddIco) {
      return buildAdd(member);
    } else if (member.avatar == R.imagesGroupDeleteIco) {
      return buildDelete(member);
    } else {
      return buildAvatar(member);
    }
  }

  Widget buildGridViewItem(ChatRoomMember member) {
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
            child:buildClipOval(member),
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
          return buildGridViewItem(member);
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
