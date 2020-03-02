import 'package:flutter_app_demo/bloc/blocdemo/model/UserInfo.dart';
import 'package:flutter_app_demo/bloc/blocdemo/presenter/LoginPresenter.dart';
import 'package:rxdart/rxdart.dart';
///
/// bloc控制模块
///
class LoginBloc {


  final loginPresenter = LoginPresenter();

  final _loginFetcher = PublishSubject<UserInfo>();

  Observable<UserInfo> get getUserInfo=>_loginFetcher.stream;


  login() async{
    UserInfo userInfo = await loginPresenter.login();
    _loginFetcher.sink.add(userInfo);

  }



  dispose(){
    _loginFetcher.close();
  }

}


final loginBloc = LoginBloc();
