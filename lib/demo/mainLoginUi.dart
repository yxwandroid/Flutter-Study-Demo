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
  TextEditingController pwdController = TextEditingController();
  @override
  void initState() {
    pwdController.addListener(pwdTFListenter);
    super.initState();
  }

  pwdTFListenter() {
    // print(pwdController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: new Container(
          height: 50,
          width: 300,
            decoration: new BoxDecoration(
              border: new Border.all(width: 1.0, color: Color(0xff95A2AA),),
              color: Colors.white,
              borderRadius: new BorderRadius.all(new Radius.circular(5.0)),
            ),
          alignment: Alignment.center, //        color: Colors.amberAccent,
          child: new Row(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.all(10),
                child: new Image.asset(
                  'images/pwd.png',
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit.cover,
                ),),
              new Container(
                height: 50,
                width: 1,
                color: Color(0xff95A2AA),
                child: new Text(""),
              ),
              new Container(
                color: Colors.white,
                width: 200,
                height: 50,
                child: TextField(
                  controller: pwdController,
                  cursorColor:Color(0xff95A2AA),
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    //labelText: '请输入名称',
                    hintText: '请输入账号',
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




  Widget buildTextField(TextEditingController controller) {
    return TextField(
      controller: controller,
      cursorColor:Color(0xff95A2AA),
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          //labelText: '请输入名称',
          hintText: '请输入账号',
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),

    ),
    );
  }
}

//  new TextField(
//              controller: pwdController,
//              autocorrect: true,
//              autofocus: true,
//              obscureText: true,
//              textAlign: TextAlign.left,
//              style: TextStyle(fontSize: 15.0, color: Colors.black),
//              onChanged: (text) {},
////              onSubmitted: (text) {
////                print('内容提交时回调 $text');
////              },
////              enabled: true,
//              //是否禁用
//              decoration: InputDecoration(
//                contentPadding:  const EdgeInsets.symmetric(vertical: 3.0),
//                hintText: '请输入密码',
//                border: OutlineInputBorder(
//                    borderRadius: BorderRadius.circular(5),
//                    borderSide: BorderSide(color: Colors.red,
//                        width: 1.0,
//                        style: BorderStyle.solid) //没什么卵效果
//                ),
//                //添加装饰效果
//                fillColor: Colors.white,
//                //添加灰色填充色
//                filled: true,
////                prefixIcon: new Container(
////                  decoration: BoxDecoration(
////                      image: DecorationImage(
////                        image: AssetImage("images/pwd.png"),
////                        fit: BoxFit.cover,
////                      )
////                  ),
////                  width: 1,
////                  height: 1,
////                  child:new Row(children: <Widget>[
////                    new Text("w"),
////                    new Container(
////                      width: 33,
////                      height: 33,
////                      color: Colors.red,
////                    )
////                  ],),
////                ),
//
//              ),
//            ),
