import 'dart:async';

import 'package:flutter/material.dart';

class RefreshIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new RefreshIndicatorDemoState();
  }
}

class RefreshIndicatorDemoState extends State<RefreshIndicatorDemo> {

  ScrollController _controller = ScrollController();
  List<String> listData = new List();
  bool isLoadMore = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    listData.add("2");
    _controller.addListener((){

      if (_controller.position.pixels == _controller.position.minScrollExtent) {
        print("滑动到顶部");
      }else if(_controller.position.pixels == _controller.position.maxScrollExtent){
        print("滑动到底部");
      }

    });
  }

  Widget buildListView() {
    return new ListView.builder(
      controller: _controller,
      padding: const EdgeInsets.all(16.0),
      itemCount: listData.length,
      itemBuilder: (context, i) {
        return Text(listData.elementAt(i) + i.toString());
      },
    );
  }

  Future _handleRefresh() async {

    if(isLoadMore){
      return ;
    }
    print("滑动到顶部");
    // 延迟3秒后添加新数据， 模拟网络加载
    await Future.delayed(Duration(seconds: 3), () {
      isLoadMore = false;
      setState(() {

        listData.clear();
        for (int i = 0; i < 60; i++) {
          listData.add("" + i.toString());
        }
        _controller.jumpTo(_controller.position.maxScrollExtent);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: RefreshIndicator(child: buildListView(), onRefresh: _handleRefresh),);
//        child: RefreshIndicator(child: buildListView(), onRefresh: _handleRefresh),);
  }
}
