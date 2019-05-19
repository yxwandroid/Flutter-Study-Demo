import 'package:flutter/material.dart';

import 'ExpansionTiles/UserInfo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TwoLevelListDemo(),
    );
  }
}
//
//class MyHomePage extends StatefulWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//
//  @override
//  TwoLevelListDemo createState() => TwoLevelListDemo();
//}

//typedef void OnItemClickListener(UserInfo info);


//class _MyHomePageState extends State<MyHomePage> {
//
//
//
//
//
//  final List<UserInfo> data = <UserInfo>[
//    const UserInfo(
//      title: '我的好友',
//      children: <UserInfo>[
//        const UserInfo(title: '张三', subTitle: 'xxxxx'),
//        const UserInfo(title: '李四', subTitle: 'xxxxxxxxxx'),
//      ],
//    ),
//    //省略,读者自己补上..........
//  ];
//
//
//
//  ///根据UserInfo构建一个条目内容：
//  Widget _buildTiles(UserInfo root) {
//    if (root.children.isEmpty)
//
//      ///展开的内容item
//      return new Container(
//        padding: const EdgeInsets.all(8.0),
//        child: new ListTile(
//          onTap: () {
////            if (null != onItemClickListener) {
////              this.onItemClickListener(root);
////            }
//          },
//          leading: new CircleAvatar(
//            backgroundImage: new AssetImage('images/zhubo01.jpg'),
//          ),
//          title: new Text(root.title),
//          subtitle: new Text(root.subTitle),
//        ),
//      );
//    ///内容父标题
//    return new ExpansionTile(
//      //记录滚动位置
//      key: new PageStorageKey<UserInfo>(root),
//      title: new Text(root.title),
//      //遍历下面的childEntry
//      children: root.children.map(_buildTiles).toList(),
//    );
//  }
//
//
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//
//
//  ///使用ListView.builder创建列表，复用列表
//
//
//  @override
//  Widget build(BuildContext context) {
//    print(mounted);
//    return Scaffold(
//      appBar: AppBar(
//        title: Text(widget.title),
//      ),
//      body: new ListView.builder(
//        itemBuilder: (BuildContext context, int index) =>
//        new EntryItem(data[index], (info) {
//          //这里省略SnackBar显示内容代码,读者自己补上
//          //new Text(info.title + "\n" + info.subTitle)
//        }),
//        itemCount: data.length,
//      ),
//    );
//  }
//}



class TwoLevelListDemo extends StatelessWidget {
  static const String routeName = '/material/two-level-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expand/collapse list control'),
//          actions: <Widget>[MaterialDemoDocumentationButton(routeName)],
        ),
        body: ListView(
            children: <Widget>[
              const ListTile(title: Text('Top')),
              ExpansionTile(
                  title: const Text('Sublist'),
                  backgroundColor: Theme.of(context).accentColor.withOpacity(0.025),
                  children: const <Widget>[
                    ListTile(title: Text('One')),
                    ListTile(title: Text('Two')),
                    // https://en.wikipedia.org/wiki/Free_Four
                    ListTile(title: Text('Free')),
                    ListTile(title: Text('Four'))
                  ]
              ),
            ]
        )
    );
  }
}
