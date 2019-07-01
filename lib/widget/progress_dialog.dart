import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressDialog extends StatelessWidget {
  final bool loading;
  final Widget child;

  ProgressDialog({Key key, @required this.loading, @required this.child})
      : assert(child != null),
        assert(loading != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    //如果正在加载，则显示加载添加加载中布局
    if (loading) {
      //环形进度条
      widgetList.add(Center(
        child: Container(
          width: 130,
          height: 130,
//          padding: const EdgeInsets.all(30.0),
          decoration: BoxDecoration(
            //黑色背景
              color: Colors.black87,
              //圆角边框
              borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            //控件里面内容主轴负轴剧中显示
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            //主轴高度最小
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CupertinoActivityIndicator(
                radius: 20,
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '准备开始群聊...',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ));
    }
    return Stack(
      children: widgetList,
    );
  }
}
