import 'dart:convert';

import 'package:flutter/material.dart';

import 'EntryNew.dart';

class Entry {
  final String title;
  final List<Entry>
      children; // Since this is an expansion list ...children can be another list of entries
  Entry(this.title, [this.children = const <Entry>[]]);
}

// This is the entire multi-level list displayed by this app
final List<Entry> data = <Entry>[
  Entry(
    'Chapter A',
    <Entry>[
      Entry(
        'Section A0',
        <Entry>[
          Entry('Item A0.1'),
          Entry('Item A0.2'),
          Entry('Item A0.3'),
        ],
      ),
      Entry('Section A1'),
      Entry('Section A2'),
    ],
  ),
  // Second Row
  Entry('Chapter B', <Entry>[
    Entry('Section B0'),
    Entry('Section B1'),
  ]),
  Entry(
    'Chapter C',
    <Entry>[
      Entry('Section C0'),
      Entry('Section C1'),
      Entry(
        'Section C2',
        <Entry>[
          Entry('Item C2.0'),
          Entry('Item C2.1'),
          Entry('Item C2.2'),
          Entry('Item C2.3'),
        ],
      )
    ],
  ),
];

// Create the Widget for the row
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry, this.callBack);
  final Function callBack;
  final EntryNew entry;

  Widget _buildReply(Reply root) {
    return ListTile(
      onTap: (){
        callBack(root);
      },
        title: Container(
        margin:EdgeInsets.only(left: 30),
        child: Text(root.title)));
  }

  Widget _buildTiles(EntryNew root) {
    if (root.children.isEmpty) {
      return ExpansionTile(
        key: PageStorageKey<EntryNew>(root),
        title: Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(root.groupName)),
        children: root.replys.map<Widget>(_buildReply).toList(),
      );
    } else {
      List<Widget> replys = root.replys.map<Widget>(_buildReply).toList();
      List<Widget> children = root.children.map<Widget>(_buildTiles).toList();
      List<Widget> all = List();
      all.addAll(children);
      all.addAll(replys);
      return ExpansionTile(
        key: PageStorageKey<EntryNew>(root),
        title: Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(root.groupName)),
        children: all,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}

class MultiListWidget extends StatefulWidget {
  MultiListWidget({Key key}) : super(key: key);

  @override
  _MultiListWidgetState createState() {
    return _MultiListWidgetState();
  }
}

//https://www.coderzheaven.com/2019/07/14/expanded-multi-level-list-in-flutter-for-android-and-ios/
//参考
class _MultiListWidgetState extends State<MultiListWidget> {
  List entryNews = new List();

  @override
  void initState() {
    super.initState();
    Future<String> loadString =
        DefaultAssetBundle.of(context).loadString("data/EntryData.json");

    loadString.then((String value) {
      // 通知框架此对象的内部状态已更改
      setState(() {
        // 将参数赋予存储点击数的变量
        List data = json.decode(value);
        print(data);
        data.forEach((element) {
          EntryNew entryNew = EntryNew.fromJson(element);
          entryNews.add(entryNew);
        });

        print(entryNews.length);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("expandable three"),
      ),
      body: ListView.builder(
        itemCount: entryNews.length,
        itemBuilder: (BuildContext context, int index) => EntryItem(
          entryNews[index], fastReply
        ),
      ),
    );
  }

  fastReply(Reply reply){
    print(reply.title);

  }
}
