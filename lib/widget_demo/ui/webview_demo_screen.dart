import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewDemoScreen extends StatefulWidget {
  WebViewDemoScreen();
  @override
  createState() => _WebViewDemoScreenState();
}
class _WebViewDemoScreenState extends State<WebViewDemoScreen> {
  var _url;
  final _key = UniqueKey();
  _WebViewDemoScreenState();

  @override
  void initState() {
    super.initState();

    _url = "https://baidu.com";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                child: WebView(
                    key: _key,
                    javascriptMode: JavascriptMode.unrestricted,
                    initialUrl: _url))
          ],
        ));
  }
}