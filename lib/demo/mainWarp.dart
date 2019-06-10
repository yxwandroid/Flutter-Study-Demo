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

    String ss = "[微笑]";
    String sss = "[坏笑][左哼哼]";
    String ssss = "你好[坏笑][左哼哼][右哼哼]你好那你";
    String str = "你好[坏笑][左哼哼]呃呃呃[右哼哼]试试的";

    var emojiReg =   new RegExp("(\\[.+?\\])");
    var emojiMatches = emojiReg.allMatches(str);


    List<String>  emojis = new List();
    for (Match m in emojiMatches) {
      String match = m.group(0);
      print(match);
      emojis.add(match);
    }



    List<String>  strs = new List();
    String temp = str;
    int   tempPosition = 0;





  }




  getEmojiImage(){

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
           Wrap(
              children: <Widget>[
                Text(
                  'You have',
                ),
                Image.asset(
                  "images/emoji/fuck27.png",
                  width: 20,
                  height: 20,
                ),
                Image.asset(
                  "images/emoji/fuck27.png",
                  width: 20,
                  height: 20,
                ),
                Image.asset(
                  "images/emoji/fuck27.png",
                  width: 20,
                  height: 20,
                ),
                Image.asset(
                  "images/emoji/fuck27.png",
                  width: 20,
                  height: 20,
                ),
                Image.asset(
                  "images/emoji/fuck27.png",
                  width: 20,
                  height: 20,
                ),
                Image.asset(
                  "images/emoji/fuck27.png",
                  width: 20,
                  height: 20,
                ),
                Image.asset(
                  "images/emoji/fuck27.png",
                  width: 20,
                  height: 20,
                ),
                Image.asset(
                  "images/emoji/fuck27.png",
                  width: 20,
                  height: 20,
                ),
                Image.asset(
                  "images/emoji/fuck27.png",
                  width: 20,
                  height: 20,
                ),
                Image.asset(
                  "images/emoji/fuck27.png",
                  width: 20,
                  height: 20,
                ),
                Image.asset(
                  "images/emoji/fuck27.png",
                  width: 20,
                  height: 20,
                ),
                Text(
                  'You have',
                ),
                Text(
                  'You have',
                ),
                Text(
                  'You have',
                ),
                Image.asset(
                  "images/emoji/fuck27.png",
                  width: 20,
                  height: 20,
                ),
                Text(
                  'You have',
                ),
                Text(
                  'You have',
                ),
                Text(
                  'You have',
                ),
                Text(
                  'You have',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
