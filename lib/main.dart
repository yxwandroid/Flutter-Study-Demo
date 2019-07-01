import 'package:flutter/material.dart';
import 'package:flutter_app_demo/ui/container_demo_screen.dart';
import 'package:flutter_app_demo/ui/dialog_demo_screen.dart';
import 'package:flutter_app_demo/ui/expansion_title_demo_screen.dart';
import 'package:flutter_app_demo/ui/grid_view_demo_screen .dart';
import 'package:flutter_app_demo/chat/mainSysytem.dart';
import 'package:flutter_app_demo/ui/image_demo_screen.dart';
import 'package:flutter_app_demo/ui/listview_demo_screen.dart';
import 'package:flutter_app_demo/ui/progress_dialog_demo_screen.dart';
import 'package:flutter_app_demo/ui/refreshIndicator_demo_screen.dart';
import 'package:flutter_app_demo/ui/stack_demo_screen.dart';
import 'package:flutter_app_demo/ui/tab_bar_view_demo_screen.dart';
import 'package:flutter_app_demo/ui/text_edit_demo_screen.dart';
import 'package:flutter_app_demo/ui/view_pager_indicator_demo.dart';
import 'package:flutter_app_demo/ui/emoji_screen.dart';
import 'package:flutter_app_demo/utils/route_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
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
  List<String> demoList = List();

  @override
  void initState() {
    super.initState();
    demoList.add("GridView使用");
    demoList.add("加载动画");
    demoList.add("Container 使用");
    demoList.add("ViewPagerIndicator 使用");
    demoList.add("Dialog 使用");
    demoList.add("仿微信发送表情组件");
    demoList.add("ExpansionTileDemo");
    demoList.add("ListView 下拉刷新");
    demoList.add("TabBar使用");
    demoList.add("ViewPagerIndicator 使用");
    demoList.add("ListView 使用");
    demoList.add("TextField 使用");
    demoList.add("Image 各种操作");
    demoList.add("Stack 各种操作");
  }

  onItemClick(int index) {
    switch (index) {
      case 0:
        GridViewDemoScreen.enter(context);
        break;
      case 1:
        RouteHelper.pushWidget(context, ProgressDialogDemoScreen());
        break;
      case 2:
        RouteHelper.pushWidget(context, ContainerDemoScreen());
        break;
      case 3:
        RouteHelper.pushWidget(context, ViewPagerIndicatorDemo());
        break;
      case 4:
        RouteHelper.pushWidget(context, DialogDemoScreen());
        break;
      case 5:
        RouteHelper.pushWidget(context, EmojiScreen());
        break;
      case 6:
        RouteHelper.pushWidget(context, ExpansionTileDemoScreen());
        break;
      case 7:
        RouteHelper.pushWidget(context, RefreshIndicatorDemoScreen());
        break;
      case 8:
        RouteHelper.pushWidget(context, TabBarViewDemoScreen());
        break;
      case 9:
        RouteHelper.pushWidget(context, ViewPagerIndicatorDemo());
        break;
      case 10:
        RouteHelper.pushWidget(context, ListViewDemoScreen());
        break;
      case 11:
        RouteHelper.pushWidget(context, TextFieldDemoScreen());
        break;
      case 12:
        RouteHelper.pushWidget(context, ImageDemoScreen());
        break;
      case 13:
        RouteHelper.pushWidget(context, StackDemoScreen());
        break;

      default:
        print("index  " + index.toString());
    }
  }

  Widget buildItem(int index) {
    return GestureDetector(
      onTap: () {
        onItemClick(index);
      },
      child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text(demoList.elementAt(index))),
              Divider(height: 1.0, color: Colors.black),
            ],
          )),
    );
  }

  ListView buildListView() {
    return ListView.builder(
      padding: new EdgeInsets.all(10),
      itemCount: demoList.length,
      itemBuilder: (BuildContext context, int index) {
        return buildItem(index);
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

//      home: VoiceView(),
//      home: DialogDemo(),
//home: ExpansionTileSample(),
