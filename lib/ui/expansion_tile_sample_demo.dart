import 'package:flutter/material.dart';

class ExpansionTileSample extends StatefulWidget {
  @override
  _ExpansionTileSampleState createState() {
    return _ExpansionTileSampleState();
  }
}

class _ExpansionTileSampleState extends State<ExpansionTileSample> {
  final List<ReplyModel> data = <ReplyModel>[
    new ReplyModel(
      '常用回复',
      <String>[
        "价格可以优惠吗",
        "价格可以优惠吗",
        "价格可以优惠吗",
      ],
    ),
    new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],
    ),
  ];

  @override
  void initState() {
    //    初始化数据
    super.initState();
  }

  onItemClick(String item) {
    print(item);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
        new ReplyItem(data[index], onItemClick),
        itemCount: data.length,
      ),
    );
  }
}

///快捷语回复Item
class ReplyItem extends StatelessWidget {
  const ReplyItem(this.entry, this.func);

  final func;
  final ReplyModel entry;

  Widget _buildTiles(ReplyModel root) {
    if (root.children.isEmpty) {
      return new ListTile(title: new Text(root.title));
    } else {
      return new ExpansionTile(
        key: new PageStorageKey<ReplyModel>(root),
        title: new Text(root.title),
        children: buildItem(root),
      );
    }
  }

  List<Widget> buildItem(ReplyModel root) {
    List<Widget> tempList = new List();
    for (int i = 0; i < root.children.length; i++) {
      tempList.add(Container(
          child: GestureDetector(
              onTap: () {
                onItemClick(root.children.elementAt(i));
              },
              child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Image.asset(
                                "images/search.png",
                                width: 20,
                                height: 20,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                root.children.elementAt(i),
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 0.2,
                        width: double.infinity,
                        color: Colors.black,
                      )
                    ],
                  )))));
    }
    return tempList;
  }

  onItemClick(String item) {
    func(item);
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class ReplyModel {
  ReplyModel(this.title, [this.children = const <String>[]]);

  final String title;
  final List<String> children;
}
