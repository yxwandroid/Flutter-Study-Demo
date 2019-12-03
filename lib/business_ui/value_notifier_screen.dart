import 'package:flutter/material.dart';
class ComplicatedObject {
  int number;
  String title;

  ComplicatedObject({this.number, this.title});
}
class ComplicatedObjectNotifier extends ValueNotifier<ComplicatedObject> {

  ComplicatedObjectNotifier(ComplicatedObject object): super(object);

  void setTitle(String newTitle) {
    value.title = newTitle;
    //这句是关键 一定要写。
    notifyListeners();
  }

}

///参考
///http://www.muliba.net/flutter/2019/06/14/flutter%E6%95%B0%E6%8D%AE%E7%9B%91%E5%90%AC%E5%99%A8.html
class ValueNotifierScreen extends StatefulWidget {
  @override
  _ValueNotifierScreenState createState() => _ValueNotifierScreenState();
}


class _ValueNotifierScreenState extends State<ValueNotifierScreen> {
  final ComplicatedObjectNotifier _notifier = ComplicatedObjectNotifier(ComplicatedObject(number: 0, title: '标题'));
  //中间不变的内容
  Widget _content;

  void _incrementCounter() {
    _notifier.setTitle('又是新标题');
  }

  @override
  void initState() {
    _content = Center(
        child: Text(
          '这里是内容。。。。。。。。。。。。。',
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("value Notifier使用"),
      ),
      body: ValueListenableBuilder(
        valueListenable: _notifier,
        builder: (BuildContext context, ComplicatedObject value, Widget child) {
          return Column(
            children: <Widget>[
              Container(
                height: 48,
                child: Text('${value.title}',
                    style: Theme.of(context).textTheme.display1),
              ),
              Expanded(
                child: child,
                flex: 1,
              ),
              Container(
                height: 48,
                child: Text('${value.number}',
                    style: Theme.of(context).textTheme.caption),
              ),
            ],
          );
        },
        child: _content,//这里是传入上面生成好的不变的Widget
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}