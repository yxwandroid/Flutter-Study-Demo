import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/animation/mainAnimation.dart';
import 'package:flutter_app_demo/stream/stream_demo_screen.dart';
import 'package:flutter_app_demo/ui/container_demo_screen.dart';
import 'package:flutter_app_demo/ui/clip_board_screen.dart';
import 'package:flutter_app_demo/ui/dialog_demo_screen.dart';
import 'package:flutter_app_demo/ui/expandableListView_screen.dart';
import 'package:flutter_app_demo/ui/expansion_title_demo_screen.dart';
import 'package:flutter_app_demo/ui/grid_view_demo_screen .dart';
import 'package:flutter_app_demo/ui/image_demo_screen.dart';
import 'package:flutter_app_demo/ui/inheritedwidget_screen.dart';
import 'package:flutter_app_demo/ui/listview_demo_screen.dart';
import 'package:flutter_app_demo/ui/notification_screen.dart';
import 'package:flutter_app_demo/ui/popup_page_screen.dart';
import 'package:flutter_app_demo/ui/progress_dialog_demo_screen.dart';
import 'package:flutter_app_demo/ui/refreshIndicator_demo_screen.dart';
import 'package:flutter_app_demo/ui/stack_demo_screen.dart';
import 'package:flutter_app_demo/ui/tab_bar_view_demo_screen.dart';
import 'package:flutter_app_demo/ui/text_edit_demo_screen.dart';
import 'package:flutter_app_demo/ui/view_pager_indicator_demo.dart';
import 'package:flutter_app_demo/ui/emoji_screen.dart';
import 'package:flutter_app_demo/utils/route_helper.dart';

import 'animation/voice_view_screen.dart';
import 'animation/wechat_voice_screen.dart';
import 'model/screen_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      home: Home(),
      home: MyFadeTest(),
//      home: ExpandableListViewScreen(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() {
    return _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<ScreenModel> demoList = List();

  @override
  void initState() {
    super.initState();
//    demoList.add(ScreenModel("GridView使用", GridViewDemoScreen(),
//        url:
//        "https://raw.githubusercontent.com/yxwandroid/Flutter-Study-Demo/master/gridview_demo.gif"));
    demoList.add(ScreenModel("GridView使用", GridViewDemoScreen()));
    demoList.add(ScreenModel("加载动画", ProgressDialogDemoScreen()));
    demoList.add(ScreenModel("Container 使用", ContainerDemoScreen()));
    demoList.add(ScreenModel("ViewPagerIndicator  使用", ViewPagerIndicatorDemo()));
    demoList.add(ScreenModel("Dialog  使用", DialogDemoScreen()));
    demoList.add(ScreenModel("仿微信发送表情组件 ", EmojiScreen()));
    demoList.add(ScreenModel("ExpansionTileDemo ", ExpansionTileDemoScreen()));
    demoList.add(ScreenModel("ListView 下拉刷新 ", RefreshIndicatorDemoScreen()));
    demoList.add(ScreenModel("TabBar使用  ", TabBarViewDemoScreen()));
    demoList.add(ScreenModel("ListView 使用  ", ListViewDemoScreen()));
    demoList.add(ScreenModel("TextField 使用  ", TextFieldDemoScreen()));
    demoList.add(ScreenModel("Image 使用  ", ImageDemoScreen()));
    demoList.add(ScreenModel("Stack 使用  ", StackDemoScreen()));
    demoList.add(ScreenModel("Stream 使用  ", StreamDemoScreen()));
    demoList.add(ScreenModel("Clipboard 使用  ", ClipBoardScreen()));
    demoList.add(ScreenModel("PopupPage 使用  ", PopupPageScreen()));
    demoList.add(ScreenModel("notification 使用  ", NotificationScreen()));
    demoList.add(ScreenModel("inheritedWidget 使用  ", InheritedWidgetScreen()));
    demoList.add(ScreenModel("expandableListView 使用  ", ExpandableListViewScreen()));
    demoList.add(ScreenModel("flutter实现微信播放语音动画 ", WeChatVoiceScreen()));
    demoList.add(ScreenModel("flutter实现微信发送语音动画 ", VoiceViewScreen()));

  }

  onItemClick(ScreenModel screenModel) {
    RouteHelper.pushWidget(context, screenModel.widget);
  }

  Widget buildItem(ScreenModel screenModel) {
    return GestureDetector(
      onTap: () {
        onItemClick(screenModel);
      },
      child: Row(
        children: <Widget>[
          screenModel.url != null
              ? Container(

            child: CachedNetworkImage(
              width: 100,
//                    height: 100,
              fit: BoxFit.fitWidth,
              imageUrl: screenModel.url,
              placeholder: (context, url) =>
              new CircularProgressIndicator(),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
          )
              : Container(),
          Container(margin: EdgeInsets.all(10), child: Text(screenModel.name)),
        ],
      ),
    );
  }

  ListView buildListView() {
    return ListView.separated(
      padding: new EdgeInsets.all(10),
      itemCount: demoList.length,
      itemBuilder: (BuildContext context, int index) {
        return buildItem(demoList.elementAt(index));
      },
      separatorBuilder: (context, index) {
        return Container(
          constraints: BoxConstraints.tightFor(height: 1),
          color: Colors.black45,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 学习"),
      ),
      body: buildListView(),
    );
  }
}
