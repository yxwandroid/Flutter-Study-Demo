//首先导入自定义Widget所在文件
import 'package:flutter/material.dart';

import 'CustomCombinedWidget.dart';

//在页面Widget中使用


class CoustomHomePage extends StatefulWidget{
  @override
  _HomePageState createState()  => new  _HomePageState();

}

class _HomePageState extends State<CoustomHomePage> {
  String tips = '这里是提示';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('自定义组合Widget'),
      ),
      body: Container(
        child: buildCombinedWidget(),
      ),
    );
  }

  Widget buildCombinedWidget() {
    return Center(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              CustomCombinedWidget( //使用自定义Widget
                iconData: Icons.home,
                title: '首页',
                onTap: () {
                  setState(() {
                    this.tips = '点击了首页';
                  });
                },
              ),
              CustomCombinedWidget(
                iconData: Icons.list,
                title: '产品',
                onTap: () {
                  setState(() {
                    this.tips = '点击了产品';
                  });
                },
              ),
              CustomCombinedWidget(
                iconData: Icons.more_horiz,
                title: '更多',
                onTap: () {
                  setState(() {
                    this.tips = '点击了更多';
                  });
                },
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 50),
            child: Text(
              this.tips,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
