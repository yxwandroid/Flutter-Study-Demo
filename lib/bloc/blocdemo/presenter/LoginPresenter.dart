import 'package:flutter_app_demo/bloc/blocdemo/model/UserInfo.dart';
import 'package:flutter_app_demo/bloc/blocdemo/provider/LoginApiProvider.dart';

///
///登录模块的控制类
///
class LoginPresenter {
  final loginApiProvider = new LoginApiProvider();

  Future<UserInfo> login() => loginApiProvider.login();
}
