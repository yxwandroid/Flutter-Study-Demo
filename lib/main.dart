import 'package:flutter/material.dart';
import 'package:flutter_app_demo/ui/dialog_demo.dart';
import 'package:flutter_app_demo/ui/expansion_tile_sample_demo.dart';
import 'package:flutter_app_demo/ui/grid_view_demo.dart';
import 'package:flutter_app_demo/ui/view_pager_indicator_demo.dart';
import 'animation/main_voice_send.dart';
import 'model/ChatRoomMember.dart';

void main() => runApp(MyApp());

List<ChatRoomMember> allChatList = [
  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
          "http://wx.qlogo.cn/mmhead/ver_1/j5PyKKAEPBpAjKPZUQWXNUUCmGH9ZyMKNFpMAgwRxbpjsOmBF3cQXPb0IJkG1yArRq7SmSZYM2obcm4am7B1I2vNLfz48o6GUbcFxWRMPps/0"),
  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "http://wx.qlogo.cn/mmhead/ver_1/j5PyKKAEPBpAjKPZUQWXNUUCmGH9ZyMKNFpMAgwRxbpjsOmBF3cQXPb0IJkG1yArRq7SmSZYM2obcm4am7B1I2vNLfz48o6GUbcFxWRMPps/0"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "http://wx.qlogo.cn/mmhead/ver_1/j5PyKKAEPBpAjKPZUQWXNUUCmGH9ZyMKNFpMAgwRxbpjsOmBF3cQXPb0IJkG1yArRq7SmSZYM2obcm4am7B1I2vNLfz48o6GUbcFxWRMPps/0"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "http://wx.qlogo.cn/mmhead/ver_1/j5PyKKAEPBpAjKPZUQWXNUUCmGH9ZyMKNFpMAgwRxbpjsOmBF3cQXPb0IJkG1yArRq7SmSZYM2obcm4am7B1I2vNLfz48o6GUbcFxWRMPps/0"),
  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "http://wx.qlogo.cn/mmhead/ver_1/j5PyKKAEPBpAjKPZUQWXNUUCmGH9ZyMKNFpMAgwRxbpjsOmBF3cQXPb0IJkG1yArRq7SmSZYM2obcm4am7B1I2vNLfz48o6GUbcFxWRMPps/0"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "http://wx.qlogo.cn/mmhead/ver_1/j5PyKKAEPBpAjKPZUQWXNUUCmGH9ZyMKNFpMAgwRxbpjsOmBF3cQXPb0IJkG1yArRq7SmSZYM2obcm4am7B1I2vNLfz48o6GUbcFxWRMPps/0"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "http://wx.qlogo.cn/mmhead/ver_1/j5PyKKAEPBpAjKPZUQWXNUUCmGH9ZyMKNFpMAgwRxbpjsOmBF3cQXPb0IJkG1yArRq7SmSZYM2obcm4am7B1I2vNLfz48o6GUbcFxWRMPps/0"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "http://wx.qlogo.cn/mmhead/ver_1/j5PyKKAEPBpAjKPZUQWXNUUCmGH9ZyMKNFpMAgwRxbpjsOmBF3cQXPb0IJkG1yArRq7SmSZYM2obcm4am7B1I2vNLfz48o6GUbcFxWRMPps/0"),
  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "http://wx.qlogo.cn/mmhead/ver_1/j5PyKKAEPBpAjKPZUQWXNUUCmGH9ZyMKNFpMAgwRxbpjsOmBF3cQXPb0IJkG1yArRq7SmSZYM2obcm4am7B1I2vNLfz48o6GUbcFxWRMPps/0"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "http://wx.qlogo.cn/mmhead/ver_1/j5PyKKAEPBpAjKPZUQWXNUUCmGH9ZyMKNFpMAgwRxbpjsOmBF3cQXPb0IJkG1yArRq7SmSZYM2obcm4am7B1I2vNLfz48o6GUbcFxWRMPps/0"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "http://wx.qlogo.cn/mmhead/ver_1/j5PyKKAEPBpAjKPZUQWXNUUCmGH9ZyMKNFpMAgwRxbpjsOmBF3cQXPb0IJkG1yArRq7SmSZYM2obcm4am7B1I2vNLfz48o6GUbcFxWRMPps/0"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "http://wx.qlogo.cn/mmhead/ver_1/j5PyKKAEPBpAjKPZUQWXNUUCmGH9ZyMKNFpMAgwRxbpjsOmBF3cQXPb0IJkG1yArRq7SmSZYM2obcm4am7B1I2vNLfz48o6GUbcFxWRMPps/0"),

  ChatRoomMember(
      wechatId: "www",
      nickname: "wilson",
      avatar:
      "http://wx.qlogo.cn/mmhead/ver_1/j5PyKKAEPBpAjKPZUQWXNUUCmGH9ZyMKNFpMAgwRxbpjsOmBF3cQXPb0IJkG1yArRq7SmSZYM2obcm4am7B1I2vNLfz48o6GUbcFxWRMPps/0"),




];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //      home: VoiceView(),
      //      home: ViewPagerIndicatorDemo(),
      //      home: DialogDemo(),
      home: GridViewDemo(allChatList),
      //      home: ExpansionTileSample(),
    );
  }
}
