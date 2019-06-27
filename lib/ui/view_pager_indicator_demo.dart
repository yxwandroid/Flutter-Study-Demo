import 'package:flutter/material.dart';
import 'package:flutter_app_demo/model/reply_model.dart';
import 'package:flutter_app_demo/widget/search_widget.dart';


class ViewPagerIndicatorDemo extends StatefulWidget {
  @override
  _ViewPagerIndicatorDemoState createState() {
    return _ViewPagerIndicatorDemoState();
  }
}

class _ViewPagerIndicatorDemoState extends State<ViewPagerIndicatorDemo>
    with AutomaticKeepAliveClientMixin {
  List<String> data = ['个人快捷语', '公共快捷语', '部门快捷语'];
  int initPosition = 0;

  List<ReplyModel1> replyModes = new List();
  List<Widget> oneList = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    replyModes = <ReplyModel1>[
      new ReplyModel1(
          groupName: "嘻嘻",
          replys: [new ReplysListBean(title: "早上好"),new ReplysListBean(title: "早上好"),new ReplysListBean(title: "早上好")]
      ),
      new ReplyModel1(
          groupName: "哈哈",
          replys: [new ReplysListBean(title: "22"),new ReplysListBean(title: "w"),new ReplysListBean(title: "e")]
      ),
    ];

    oneList = buildListView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomTabView(
            initPosition: initPosition,
            itemCount: data.length,
            tabBuilder: (context, index) => Tab(text: data[index]),
            pageBuilder: (context, index) =>
                Container(child: buildReplyWidget(data[index])),
            onPositionChange: (index) {
              //              print('current position: $index');
              initPosition = index;
            },
            onScroll: (position) => print('$position'),
          ),
        ),
      ),
    );
  }

  Widget buildReplyWidget(String name) {
    if (name == "个人快捷语") {
      return Container(
        child: new Column(
          children: oneList,
        ),
      );
    } else if (name == "公共快捷语") {
      return Container(
        child: Text("2"),
      );
    } else {
      return Container(
        child: Text("3"),
      );
    }
  }

  List<Widget> buildListView() {
    List<Widget> replyItems = new List();
    replyItems.add(SearchWidget.getHeaderView());
    for (int i = 0; i < replyModes.length; i++) {
      var itemWidget = buildItem(replyModes.elementAt(i));
      var tempEx = ExpansionTile(
        title: Text(replyModes.elementAt(i).groupName),
        children: itemWidget,
      );
      replyItems.add(tempEx);
    }
    return replyItems;
  }

  List<Widget> buildItem(ReplyModel1 root) {
    List<Widget> tempList = new List();
    for (int i = 0; i < root.replys.length; i++) {
      tempList.add(Container(
          child: GestureDetector(
              onTap: () {
                onItemClick(root.replys.elementAt(i));
              },
              child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 50,
                        child: Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Image.asset(
                                "images/search.png",
                                width: 20,
                                height: 20,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                root.replys.elementAt(i).title,
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 0.2,
                        width: double.infinity,
                        color: Colors.black,
                      )
                    ],
                  )))));
    }
    return tempList;
  }

  onItemClick(ReplysListBean itemReply) {
    print(itemReply.toString());
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

/// Implementation
class CustomTabView extends StatefulWidget {
  final int itemCount;
  final IndexedWidgetBuilder tabBuilder;
  final IndexedWidgetBuilder pageBuilder;
  final Widget stub;
  final ValueChanged<int> onPositionChange;
  final ValueChanged<double> onScroll;
  final int initPosition;

  CustomTabView({
    @required this.itemCount,
    @required this.tabBuilder,
    @required this.pageBuilder,
    this.stub,
    this.onPositionChange,
    this.onScroll,
    this.initPosition,
  });

  @override
  _CustomTabsState createState() => _CustomTabsState();
}

class _CustomTabsState extends State<CustomTabView>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController controller;
  int _currentCount;
  int _currentPosition;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _currentPosition = widget.initPosition ?? 0;
    controller = TabController(
      length: widget.itemCount,
      vsync: this,
      initialIndex: _currentPosition,
    );
    controller.addListener(onPositionChange);
    controller.animation.addListener(onScroll);
    _currentCount = widget.itemCount;
    super.initState();
  }

  @override
  void didUpdateWidget(CustomTabView oldWidget) {
    if (_currentCount != widget.itemCount) {
      controller.animation.removeListener(onScroll);
      controller.removeListener(onPositionChange);
      controller.dispose();

      if (widget.initPosition != null) {
        _currentPosition = widget.initPosition;
      }

      if (_currentPosition > widget.itemCount - 1) {
        _currentPosition = widget.itemCount - 1;
        _currentPosition = _currentPosition < 0 ? 0 : _currentPosition;
        if (widget.onPositionChange is ValueChanged<int>) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              widget.onPositionChange(_currentPosition);
            }
          });
        }
      }

      _currentCount = widget.itemCount;
      setState(() {
        controller = TabController(
          length: widget.itemCount,
          vsync: this,
          initialIndex: _currentPosition,
        );
        controller.addListener(onPositionChange);
        controller.animation.addListener(onScroll);
      });
    } else if (widget.initPosition != null) {
      controller.animateTo(widget.initPosition);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    controller.animation.removeListener(onScroll);
    controller.removeListener(onPositionChange);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.itemCount < 1) return widget.stub ?? Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          child: TabBar(
            isScrollable: true,
            controller: controller,
            labelColor: Theme.of(context).primaryColor,
            unselectedLabelColor: Theme.of(context).hintColor,
            indicator: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
            ),
            tabs: List.generate(
              widget.itemCount,
              (index) => widget.tabBuilder(context, index),
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: List.generate(
              widget.itemCount,
              (index) => widget.pageBuilder(context, index),
            ),
          ),
        ),
      ],
    );
  }

  onPositionChange() {
    if (!controller.indexIsChanging) {
      _currentPosition = controller.index;
      if (widget.onPositionChange is ValueChanged<int>) {
        widget.onPositionChange(_currentPosition);
      }
    }
  }

  onScroll() {
    if (widget.onScroll is ValueChanged<double>) {
      widget.onScroll(controller.animation.value);
    }
  }
}
