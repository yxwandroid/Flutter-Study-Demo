import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListMyApp extends StatelessWidget {
  final List<String> items;

  ListMyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = "Dismissing Items";
    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            //通过拖动来删除小部件的widget
            return new Dismissible(
              //如果Dismissible是一个列表项 它必须有一个key 用来区别其他项
                key: new Key(item),
                //在child被取消时调用
                onDismissed: (direction) {
                  items.removeAt(index);
                  //这个和Android的SnackBar差不多
                  Scaffold.of(context).showSnackBar(
                      new SnackBar(content: new Text("$item dismissed")));
                },
                //如果指定了background 他将会堆叠在Dismissible child后面 并在child移除时暴露
                background: new Container(
                  color: Colors.red,
                ),
                child: new ListTile(
                  title: new Text("$item"),
                ));
          },
        ),
      ),
    );
  }
}
