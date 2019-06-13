import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

import 'emoji_util.dart';
// ignore: must_be_immutable
class EmoticonWidget extends StatefulWidget {

  var func;
  EmoticonWidget(this.func);

  @override
  State<EmoticonWidget> createState() {
    return EmoticonWidgetState();
  }
}

//onTap: widget.onTap,

class EmoticonWidgetState extends State<EmoticonWidget> {
  List<Widget> getAllPage() {
    List<Widget> pages = new List();
    EmojiUtil.pages.forEach((page) {
      pages.add(getWrapByPage(page));
    });

    return pages;
  }

  Widget getWrapByPage(Map<String, String> emojiPage) {
    List<Widget> emojis = new List();
    emojiPage.forEach((key, value) {
      print('key: $key, value:$value');
      Widget item = getItem(key, value);
      emojis.add(item);
    });

    Widget page = Stack(
      children: <Widget>[
        Container(

          margin: EdgeInsets.all(20), //      padding: EdgeInsets.all(10),
          child: Wrap(
            alignment: WrapAlignment.start,
            spacing: 30,
            crossAxisAlignment:WrapCrossAlignment.center,
            runSpacing: 30,
            children: emojis,
          ),
        ),
        Positioned(
          bottom: 58,
          right: 35.0,
          child: Image.asset(
            "images/delete.png",
            width: 20,
            height: 20,
          ),
        )
      ],
    );

    return page;
  }

  Widget getItem(String key, String emoji) {
    Widget item = GestureDetector(
      onTap: () {
        this.widget.func(key);
      },
      child: Image.asset(
        emoji,
        width: 20,
        height: 20,
      ),
    );
    return item;
  }



  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Color(0xffF6F6F6),
      child: Container(
        height: 200.0,
        child: PageIndicatorContainer(
          indicatorColor: Color(0xffD8D8D8),
          pageView: PageView(
            children: getAllPage(),
            //controller: controller,
          ),
          align: IndicatorAlign.bottom,
          length: 4,
          indicatorSpace: 5.0,
        ),
      ),
    );
  }
}
