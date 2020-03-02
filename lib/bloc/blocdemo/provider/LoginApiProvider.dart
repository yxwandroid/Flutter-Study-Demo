import 'package:flutter_app_demo/bloc/blocdemo/model/UserInfo.dart';

///
/// 访问APi的接口类
///
class LoginApiProvider {



  ///访问登录接口
  Future<UserInfo> login() async {
    return UserInfo("wilson", "20");
  }
}
