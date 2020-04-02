import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_demo/business_ui/async_screen.dart';
import 'package:flutter_app_demo/business_ui/value_notifier_screen.dart';
import 'package:flutter_app_demo/utils/route_helper.dart';
import 'package:flutter_app_demo/widget_demo/ui/expansion_panel_list_screen.dart';
import 'package:flutter_app_demo/widget_demo/ui/SplashPage.dart';
import 'package:flutter_app_demo/widget_demo/ui/grid_view_demo_screen.dart';
import 'package:flutter_app_demo/widget_demo/ui/mergeable_material_item_screen.dart';
import 'package:flutter_app_demo/widget_demo/widget_demo_screen.dart';

import 'animation/voice_view_screen.dart';
import 'animation/wechat_voice_screen.dart';
import 'bloc/blocdemo/ui/LoginScreen.dart';
import 'model/screen_model.dart';

void main() {
  runApp(MyApp());
}
/*配置routes*/

class MyApp extends StatelessWidget {
  static Map<String, WidgetBuilder> configRoutes = {
    SplashPage.sName: (context) => SplashPage(),
    WidgetDemoScreen.sName: (context) => WidgetDemoScreen(),
    Home.sName: (context) => Home(),
    GridViewDemoScreen.sName: (context) => GridViewDemoScreen(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//      theme: ThemeData.dark(),
//      debugShowCheckedModeBanner: true,
////路由方式1   注意跳转路由的时候使用的方式使用routeName的方式
//      navigatorObservers: [
//        NavigatorUtils.getInstance(),
//      ],
//      routes: configRoutes,
//      initialRoute: "Home",

      //路由方式2
      home: Home(),
//      home: MultiListWidget(),
//      home: MergeableMaterialItemScreen(),
//      home: ValueNotifierScreen(),
//      home: AsyncScreen(),
    );
  }
}

class Home extends StatefulWidget {
  static final String sName = "Home";

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
    demoList.add(ScreenModel("基础组件使用 ", WidgetDemoScreen()));
    demoList.add(ScreenModel("flutter实现微信播放语音动画 ", WeChatVoiceScreen()));
    demoList.add(ScreenModel("flutter实现微信发送语音动画 ", VoiceViewScreen()));
    demoList.add(ScreenModel("ValueNotifier使用 ", ValueNotifierScreen()));
    demoList.add(ScreenModel("Flutter中的异步 ", AsyncScreen()));
    demoList.add(ScreenModel("Bloc使用 ", LoginScreen()));
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
          Container(margin: EdgeInsets.all(20), child: Text(screenModel.name)),
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
