import 'package:flutter/material.dart';
import 'package:flutter_app_demo/stream/stream_demo_screen.dart';
import 'package:flutter_app_demo/ui/container_demo_screen.dart';
import 'package:flutter_app_demo/ui/dialog_demo_screen.dart';
import 'package:flutter_app_demo/ui/expansion_title_demo_screen.dart';
import 'package:flutter_app_demo/ui/grid_view_demo_screen .dart';
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

import 'model/screen_model.dart';

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
  List<ScreenModel> demoList = List();

  @override
  void initState() {
    super.initState();
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
  }

  onItemClick(ScreenModel screenModel) {
    RouteHelper.pushWidget(context, screenModel.widget);
  }

  Widget buildItem(ScreenModel screenModel) {
    return GestureDetector(
      onTap: () {
        onItemClick(screenModel);
      },
      child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(10),
                  child: Text(screenModel.name)),
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
        return buildItem(demoList.elementAt(index));
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