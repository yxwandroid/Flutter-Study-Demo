import 'package:flutter/cupertino.dart';

/**
 * https://zhuanlan.zhihu.com/p/120734866
 * 性能检测
 */
class PerformanceAnalysis1Screen extends StatefulWidget {
  @override
  _PerformanceAnalysis1ScreenState createState() =>
      _PerformanceAnalysis1ScreenState();
}

class _PerformanceAnalysis1ScreenState
    extends State<PerformanceAnalysis1Screen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: [
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.book_solid), title: Text('书籍')),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.eye_solid), title: Text('观看'))
        ]),
        tabBuilder: (context, position) {
          return CupertinoTabView(
            builder: (context) {
              return CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: (position == 0) ? Text("书籍") : Text("观看"),
                ),
                child: Center(
                    child: CupertinoButton(
                        child: Text(
                          "this is tab :$position",
                        ),
                        onPressed: () {
//                          Navigator.of(context)
//                              .push(CupertinoPageRoute(builder: (context) {
//                            return DetailScreen((position == 0) ? "书籍" : "观看");
//                          }));
                        })),
              );
            },
          );
        });
  }
}
