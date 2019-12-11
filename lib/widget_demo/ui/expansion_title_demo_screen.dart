import 'package:flutter/material.dart';

class ExpansionTileDemoScreen extends StatefulWidget {


  static enter(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext content) => ExpansionTileDemoScreen()));
  }
  @override
  _ExpansionTileDemoScreenState createState() {
    return _ExpansionTileDemoScreenState();
  }
}

class _ExpansionTileDemoScreenState extends State<ExpansionTileDemoScreen> {
  final List<ReplyModel> data = <ReplyModel>[
    new ReplyModel(
      '常用',
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

    ),  new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],

    ),  new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],

    ),  new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],

    ),  new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],

    ),  new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],

    ),  new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],

    ),  new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],

    ),  new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],

    ),  new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],

    ),  new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],

    ),  new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],

    ),  new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],

    ),  new ReplyModel(
      'Chapter B',
      <String>[
        "22",
        "22",
      ],

    ), new ReplyModel(
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
      appBar: AppBar(title: Text("expansion title 使用"),),
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
//        leading: Text("left"),
//        trailing: Text("right"),
        initiallyExpanded: true,
//        backgroundColor: Colors.yellow,
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
