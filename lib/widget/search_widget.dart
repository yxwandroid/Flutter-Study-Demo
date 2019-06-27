import 'package:flutter/cupertino.dart';

class SearchWidget {
  /// 添加头布局
 static Widget getHeaderView() {
    return new Container(
      height: 35,
      margin: const EdgeInsets.all(10.0),
//          padding: const EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
//            border: new Border.all(width: 1.0,color: Colors.grey),
        color: Color(0xffffffff), //#ffffff
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Container(
            width: 15,
            height: 15,
            child: Image.asset("images/search.png"),
          ),
          Text(
            '昵称/备注/标签',
          ),
        ],
      ),
    );
  }
}
