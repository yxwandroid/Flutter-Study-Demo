import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  void initState() {
    super.initState();


    String ss ='[转圈][转圈][转圈][转圈]';
    var  listSs= getContents(ss);


  }


  ///获取文本数组
  static List<String> getContents(String content){
    var emojiReg =   new RegExp("(\\[.+?\\])");
    var emojiMatches = emojiReg.allMatches(content);

    List<String>  emojis = new List();
    for (Match m in emojiMatches) {
      String match = m.group(0);
      emojis.add(match);
    }

    String itemStr=content;
    for(String item in emojis){
      itemStr = itemStr.replaceAll(item, "&");
    }

    var  itemSps= itemStr.split("&");
    List<String> tempArr=new List();
    for(String item in itemSps){
      if(item!=null&&item!=""){
        tempArr.add(item);
      }
    }
    tempArr.addAll(emojis);

    Map<int,String> mapStr = new Map();
    for(int i = 0;i<tempArr.length;i++){
      String  item = tempArr[i];
      int  itemLeng  = item.length;
      int itemPoision = content.indexOf(item);
      String itemStr =content.substring(itemPoision,itemPoision+itemLeng);
      mapStr[itemPoision] = itemStr;
    }

    var sortedKeys = mapStr.keys.toList()..sort();
    List<String> contentArr=new List();
    for(int item in sortedKeys){
      contentArr.add( mapStr[item]);
    }

    return contentArr;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button:  en ',
            ),
          ],
        ),
      ),
    );
  }
}
