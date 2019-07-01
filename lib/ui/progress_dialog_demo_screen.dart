import 'package:flutter/material.dart';
import 'package:flutter_app_demo/widget/progress_dialog.dart';




class ProgressDialogDemoScreen extends StatefulWidget {


  static enter(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext content) => ProgressDialogDemoScreen(title: "加载动画",)));
  }

  ProgressDialogDemoScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProgressDialogState createState() => _ProgressDialogState();
}

class _ProgressDialogState extends State<ProgressDialogDemoScreen> {
  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ProgressDialog(
        loading: _loading,
//        msg: '正在加载...',
        child: Center(
          child: RaisedButton(
            onPressed: () => _onRefresh(),
            child: Text('显示加载动画'),
          ),
        ),
      ),
    );
  }

  Future<Null> _onRefresh() async {
    setState(() {
      _loading = !_loading;
    });
    await Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _loading = !_loading;
       // Toast.show(context, "加载完成");
      });
    });
  }
}

