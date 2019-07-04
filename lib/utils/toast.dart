import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class ToastUtil{



  /*显示Toast的方法*/
  static showToast(String value){
     Fluttertoast.showToast(
         msg: value,
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.CENTER,
         timeInSecForIos: 1,
         backgroundColor: Colors.black,
         textColor: Colors.white,
         fontSize: 16.0
     );

   }



}