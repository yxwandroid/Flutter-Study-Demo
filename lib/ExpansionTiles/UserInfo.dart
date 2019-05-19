import 'package:meta/meta.dart';

class UserInfo {
  ///这里我们创建构造方法的时候使用可选的命名参数 {param1, param2, …}
  ///调用函数时，可以使用指定命名参数。
  const UserInfo({
    @required this.title,
    this.subTitle:'这家伙很懒,什么都没有写',
    this.children = const <UserInfo>[]
  }) : assert(title !=null);

  final String title;
  final String subTitle;
  final List<UserInfo> children;
}