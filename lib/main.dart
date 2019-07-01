import 'package:flutter/material.dart';
import 'package:flutter_app_demo/ui/dialog_demo.dart';
import 'package:flutter_app_demo/ui/expansion_tile_sample_demo.dart';
import 'package:flutter_app_demo/ui/grid_view_demo.dart';
import 'package:flutter_app_demo/ui/progress_dialog_demo.dart';
import 'package:flutter_app_demo/ui/view_pager_indicator_demo.dart';
import 'animation/main_voice_send.dart';
import 'demo/container_demo.dart';
import 'model/ChatRoomMember.dart';

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
  }

  onItemClick(int index) {
    switch (index) {
      case 0:
        GridViewDemo.enter(context);
        break;
      case 1:
        ProgressDialogDemo.enter(context);
        break;
      case 2:
        ContainerDemo.enter(context);
        break;
      case 3:
        ViewPagerIndicatorDemo.enter(context);
        break;
      case 4:
        DialogDemo.enter(context);
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
