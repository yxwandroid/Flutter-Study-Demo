import 'dart:async';

class RecordStream {
  ///初始化init的回调
  // ignore: close_sinks
  StreamController<String> callBack;
  Stream<String> get getCallBack => callBack.stream;

  addInfo(){
    callBack.add("wilson");
  }


  // 私有构造函数
  RecordStream._() {
    // 具体初始化代码
    callBack =  new StreamController.broadcast();
  }

  // 静态私有成员，没有初始化
  static RecordStream _instance;

  // 静态、同步、私有访问点
  static RecordStream _sharedInstance() {
    if (_instance == null) {
      _instance = RecordStream._();
    }
    return _instance;
  }

  // 单例公开访问点
  static RecordStream get getInstance => _sharedInstance();



}
