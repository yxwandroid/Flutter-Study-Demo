import 'package:flutter/material.dart';


class ExpandStateBean {
  var isOpen;
  var index;

  ExpandStateBean(this.index, this.isOpen);
}

///  包含自定义的ExpansionPanelistScreen的使用
///
class ExpansionPanelListScreen extends StatefulWidget {
  @override
  _ExpansionPanelListScreenState createState() =>
      _ExpansionPanelListScreenState();
}

class _ExpansionPanelListScreenState extends State<ExpansionPanelListScreen> {
  var currentPanelIndex = -1;
  List<int> mList;
  List<ExpandStateBean> expandStateList;

  _ExpansionPanelListScreenState() {
    mList = new List();
    expandStateList = new List();
    for (int i = 0; i < 10; i++) {
      mList.add(i);
      expandStateList.add(ExpandStateBean(i, false));
    }
  }

  _setCurrentIndex(int index, isExpand) {
    setState(() {
      expandStateList.forEach((item) {
        if (item.index == index) {
          item.isOpen = !isExpand;
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();

    var text = "";
    assert(text != null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ExpansionPanelList Demo"),
        ),
        body: SingleChildScrollView(
//          child: MyExpansionPanelList.radio(
//            children: mList.map((index) {
//              return new ExpansionPanelRadio(
//                  value: index,
//                  headerBuilder: (context, isExpanded) {
//                    return new ListTile(
//                      title: new Text("我是第$index标题"),
//                    );
//                  },
//                  body: new Text("$index"));
//            }).toList(),
//            expansionCallback: ((index, bol) {
//              _setCurrentIndex(index, bol);
//            }),
////            initialOpenPanelValue: mList[0],
//          ),
          child: ExpansionPanelList(
//            animationDuration: new Duration(seconds: 0),
            children: mList.map((index) {
              return new ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return new ListTile(
                    title: new Text('我是第$index个标题'),
                  );
                },
                body: new Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: Container(
                    height: 100.0,
                    color: Colors.blue,
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.security,
                      size: 35.0,
                    ),
                  ),
                ),
                isExpanded: expandStateList[index].isOpen,
              );
            }).toList(),
            expansionCallback: (index, bol) {
              _setCurrentIndex(index, bol);
            },
          ),
        ));
  }
}
