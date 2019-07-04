import 'dart:async';

class StreamSingleton {
  ///初始化init的回调
  // ignore: close_sinks
  StreamController<String>  _dataController =  new StreamController.broadcast();
  Stream<String> get getStrem => _dataController.stream;
  StreamSink<String> get _dataSink => _dataController.sink;
  addInfo(){
    _dataSink.add("wilson");
  }


  // 私有构造函数
  StreamSingleton._() {
    // 具体初始化代码
  }

  // 静态私有成员，没有初始化
  static StreamSingleton _instance;

  // 静态、同步、私有访问点
  static StreamSingleton _sharedInstance() {
    if (_instance == null) {
      _instance = StreamSingleton._();
    }
    return _instance;
  }

  // 单例公开访问点
  static StreamSingleton get getInstance => _sharedInstance();



  close(){
    _dataController.close();
  }


}
