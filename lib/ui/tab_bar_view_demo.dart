import 'package:flutter/material.dart';

class TabBarViewDemo extends StatefulWidget {
  @override
  _TabBarViewDemoState createState() {
    return _TabBarViewDemoState();
  }
}

class _TabBarViewDemoState extends State<TabBarViewDemo> {
  final List<Text> tabTexts = <Text>[
    new Text("eee", style: new TextStyle(fontSize: 20.0)),
    new Text("22", style: new TextStyle(fontSize: 20.0)),
    new Text("3", style: new TextStyle(fontSize: 20.0)),
  ];

  List<Tab> tabs = [];
  @override
  void initState() {
    for (int i = 0; i < tabTexts.length; i++) {
      tabs.add(new Tab(
        child: tabTexts[i],
      ));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
        length: tabs.length,
        child: new Scaffold(
            appBar: new AppBar(

              bottom: new TabBar(
                isScrollable: true,
                tabs: tabs,

              ),
            ),
          body: new TabBarView(
              children: tabTexts.map((Text tab) {
            return new Center(child: Text(tab.data));
          }).toList()),
        ));
  }
}
