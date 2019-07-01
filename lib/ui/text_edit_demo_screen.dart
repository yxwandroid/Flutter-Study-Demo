import 'package:flutter/material.dart';

class TextFieldDemoScreen extends StatefulWidget {

  @override
  _TextFieldDemoScreenState createState() => _TextFieldDemoScreenState();
}

class _TextFieldDemoScreenState extends State<TextFieldDemoScreen> {

  final TextEditingController controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("textField使用"),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(10.0),
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(5.0),
            labelText: "labelText",
          ),
        ),
        TextField(
          decoration: InputDecoration(
            helperText: "helperText",
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "更改光标颜色、宽度、半径",
          ),
          cursorColor: Color(0xffff0000),
          cursorWidth: 4.0,
          cursorRadius: Radius.circular(2.0),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "enabled: false 编辑框不可用",
          ),
          enabled: false,
        ),
        TextField(
            decoration: InputDecoration(
              labelText: "textInputAction",
            ),
            textInputAction: TextInputAction.newline
        ),
        TextField(
            decoration: InputDecoration(
              labelText: "onChanged输入监听,onEditingComplete当用户提交时调用，onSubmitted文字提交触发（键盘按键），controller编辑框的相关信息存储在里面",
            ),
            textInputAction: TextInputAction.go,
            onChanged: (text) => print("onChanged：$text"),
            onSubmitted: (text) => print("onSubmitted：$text"),
            onEditingComplete: () =>
                print("onEditingComplete：${controller.text.toString()}"),
            controller: controller
        ),
        TextField(
            decoration: InputDecoration(
              labelText: "maxLength 编辑框最多输入字数，maxLengthEnforced:true时，只能输入限制字数；maxLengthEnforced:false达到最大限制输入数仍然可以输入，这时labelText和计数器会变成红色，提示超出限制",
            ),
            maxLength: 8
        ),
        TextField(
            decoration: InputDecoration(
              labelText: "maxLength 编辑框最多输入字数，maxLengthEnforced:true时，只能输入限制字数；maxLengthEnforced:false达到最大限制输入数仍然可以输入，这时labelText和计数器会变成红色，提示超出限制",
            ),
            maxLengthEnforced: false,
            maxLength: 8
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "maxLines 编辑框最多显示行数",
          ),
          maxLines: 2,
        ),
        TextField(
            decoration: InputDecoration(
              labelText: "obscureText 是否隐藏输入，true密码样式显示，false明文显示",
            ),
            obscureText: true
        ),
        TextField(
            decoration: InputDecoration(
              labelText: "obscureText 是否隐藏输入，true密码样式显示，false明文显示",
            ),
            obscureText: false
        ),
        TextField(
            decoration: InputDecoration(
              labelText: "autofocus 自动获取焦点",
            ),
            autofocus: true
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "keyboardType 弹出键盘的类型",
          ),
          keyboardType: TextInputType.number,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: "labelText是Material Design风格的输入提示，通过labelStyle设置样式",
              labelStyle: TextStyle(
                  color: Color(0xff999999),
                  fontSize: 12.0
              )
          ),
        ),
        TextField(
          decoration: InputDecoration(
              hintText: "hintText 普通的输入提示",
              hintStyle: TextStyle(
                  color: Color(0xff999999),
                  fontSize: 12.0
              )
          ),
        ),
        TextField(
          decoration: InputDecoration(
              helperText: "helperText 显示在输入的下面",
              helperStyle: TextStyle(
                  color: Color(0xff999999),
                  fontSize: 12.0
              )
          ),
        ),
        TextField(
          decoration: InputDecoration(
            errorText: "errorText 显示在输入的下面,输入框会变成红色   显示在输入的下面,输入框会变成红色  显示在输入的下面,输入框会变成红色  显示在输入的下面,输入框会变成红色  显示在输入的下面,输入框会变成红色  显示在输入的下面,输入框会变成红色",
            errorStyle: TextStyle(
                color: Color(0xffff0000),
                fontSize: 12.0
            ),
            errorMaxLines: 2,
          ),
        ),
        TextField(
          decoration: InputDecoration(
              labelText: "prefixIcon 输入框内侧左面的Icon",
              prefixIcon: Icon(Icons.phone)
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "prefixIcon 输入框内侧左面的prefixText,可以通过prefixStyle设置样式",
            prefixText: "手机号",
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "prefix 输入框内侧左面的Widget",
            prefix: Text("手机号"),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "prefix 输入框内侧左面的Widget",
            prefix: Icon(Icons.phone),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "suffix 输入框内侧右面的Widget",
            suffix: Icon(Icons.phone),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "counterText 输入框右下角的计数器文本",
            counterText: "0/10",
            counterStyle: TextStyle(
                color: Color(0xffff0000)
            ),
          ),
        ),
        TextField(
          decoration: InputDecoration(
            labelText: "filled 是否显示输入框背景，true显示，false不显示",
            filled: true,
            fillColor: Color(0xffff0000),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          child: TextField(
            decoration: InputDecoration(
                labelText: "border  InputBorder.none没有边框，UnderlineInputBorder下边框,OutlineInputBorder四周都有边框",
                border: OutlineInputBorder(

                )
            ),
          ),
        ),
      ],
    ) ,
      ),
    );
  }
}
