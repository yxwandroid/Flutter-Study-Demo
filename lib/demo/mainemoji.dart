import 'package:flutter/material.dart';
import 'package:flutter_app_demo/utils/emoji_util.dart';

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
  }

  List<Widget> getEmojiImage() {
    List<Widget> emojis = new List();
    EmojiUtil.emojiMap.forEach((key, value) {
      print('key: $key, value:$value');
      Widget item = getItem(key,value);
      emojis.add(item);
    });

    return emojis;
  }

  Widget getItem(String key,String emoji) {
    Widget item = GestureDetector(
      onTap: () {
        print(key);
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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: getEmojiImage(),
        ),
      ),
    );
  }
}
