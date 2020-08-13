import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart';
import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
/**
 * https://zhuanlan.zhihu.com/p/120734866
 * 性能检测
 */
class PerformanceAnalysis2Screen extends StatefulWidget {
  @override
  _PerformanceAnalysis2ScreenState createState() =>
      _PerformanceAnalysis2ScreenState();
}

class _PerformanceAnalysis2ScreenState
    extends State<PerformanceAnalysis2Screen> {

  String generateMd5(String data) {
    //MD5固定算法
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('demo')),
      body: ListView.builder(
          itemCount: 30, // 列表元素个数
          itemBuilder: (context, index) {
            //反复迭代计算MD5
            String str = '1234567890abcdefghijklmnopqrstuvwxyz';
            for (int i = 0; i < 10000; i++) {
              str = generateMd5(str);
            }
            return ListTile(title: Text("Index : $index"), subtitle: Text(str));
          } // 列表项创建方法
      ),
    );
  }
}
