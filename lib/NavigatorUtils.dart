import 'package:flutter/cupertino.dart';

/// 路由的监听者
class NavigatorUtils extends NavigatorObserver {
  static NavigatorUtils navigatorUtils;
  static NavigatorUtils getInstance() {
    if (navigatorUtils == null) {
      navigatorUtils = new NavigatorUtils();
    }

    return navigatorUtils;
  }


  @override
  void didPush(Route route, Route previousRoute) {
    print("didPush----"+route.settings.name);
    super.didPush(route, previousRoute);
  }


  @override
  void didRemove(Route route, Route previousRoute) {
    print("didRemove----"+route.settings.name);
    super.didRemove(route, previousRoute);
  }
  @override
  void didReplace({Route newRoute, Route oldRoute}) {
    print("didReplace----"+newRoute.settings.name);
//    super.didReplace(newRoute, oldRoute);
  }
}