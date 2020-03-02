import 'package:flutter/material.dart';
import 'package:flutter_app_demo/bloc/blocdemo/bloc/LoginBloc.dart';
import 'package:flutter_app_demo/bloc/blocdemo/model/UserInfo.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    loginBloc.login();
  }

  @override
  void dispose() {
    super.dispose();
    loginBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Container(
        child: FlatButton(
          onPressed: () {},
          child: StreamBuilder(
            stream: loginBloc.getUserInfo,
            builder: (context, AsyncSnapshot<UserInfo> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.userName);
              } else {
                return Text("获取数据");
              }
            },
          ),
        ),
      ),
    );
  }
}
