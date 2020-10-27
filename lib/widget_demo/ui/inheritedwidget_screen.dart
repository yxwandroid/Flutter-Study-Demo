import 'dart:async';

import 'package:flutter/material.dart';

class InheritedWidgetScreen extends StatefulWidget {
  InheritedWidgetScreen({Key key}) : super(key: key);


  @override
  _InheritedWidgetScreenState createState() => _InheritedWidgetScreenState();
}

class _InheritedWidgetScreenState extends State<InheritedWidgetScreen> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("inheritedWidget 使用"),
      ),
      body: Center(
        child: ShareWidget( //使用ShareWidget
          data: _counter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text('You have clicked the button this many time:'),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: _TextWidget(), //子widget中依赖ShareWidget
              ),
              RaisedButton(
                child: Text('Increment'),
                onPressed: () => setState(() => ++_counter),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShareWidget extends InheritedWidget {

  final int data;

  ShareWidget({@required this.data, Widget child}) : super(child: child);

  //定义一个方法，方便子树中的widget获取这个widget，进而获得共享数据。
  static ShareWidget of(BuildContext context) {
    /**
     * 获取最近的给定类型的Widget，该widget必须是InheritedWidget的子类，
     * 并向该widget注册传入的context，当该widget改变时，
     * 这个context会重新构建以便从该widget获得新的值。
     * 这就是child向InheritedWidget注册的方法。
     */
    return context.dependOnInheritedWidgetOfExactType<ShareWidget>();
  }

  /**
   * framework通过使用以前占据树中的这个位置的小部件作为参数调用这个函数来区分这些情况。
   */
  @override
  bool updateShouldNotify(ShareWidget oldWidget) {
    return oldWidget.data != data;
  }
}

class _TextWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TextWidgetState();
  }
}

class _TextWidgetState extends State<_TextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
        ShareWidget
            .of(context)
            .data
            .toString()
    );
  }

  /**
   * 如果依赖的InheritedWidget改变了，framework将会调用这个方法来通知这个对象。
   * 在这个方法中调用BuildContext.inheritFromWidgetOfExactType是安全的。
   * 子类很少覆写这个方法，因为framework通常会在依赖的InheritedWidget改变后调用build方法，
   * 覆写这个方法通常用来做一些耗时的工作，比如网络请求
   */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change");
  }
}

