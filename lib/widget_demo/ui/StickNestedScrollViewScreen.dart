import 'package:flutter/material.dart';

class StickNestedScrollViewScreen extends StatefulWidget {
  @override
  _StickNestedPageState createState() => _StickNestedPageState();
}

class _StickNestedPageState extends State<StickNestedScrollViewScreen>
    with
        SingleTickerProviderStateMixin,
        AutomaticKeepAliveClientMixin<StickNestedScrollViewScreen> {
  TabController _timeTabController;

  @override
  void initState() {
    super.initState();
    this._timeTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _timeTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double _spikeHeight = 300;
    double _appBarHeight = _spikeHeight - kToolbarHeight;

    return Scaffold(
      appBar: AppBar(
        title: Text("标题"),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverAppBar(
                backgroundColor: Color(0xfff1f1f1),
                forceElevated: innerBoxIsScrolled,
                bottom: PreferredSize(
                    child: Container(),
                    preferredSize: Size.fromHeight(_appBarHeight)),
                flexibleSpace: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.white,
                      width: double.infinity,
                      height: _spikeHeight,
                      child: Text("32"),
                    )
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
              delegate: StickyTabBarDelegate(
                child: TabBar(
                  labelColor: Colors.black,
                  controller: this._timeTabController,
                  tabs: <Widget>[
                    Tab(text: 'Home'),
                    Tab(text: 'Profile'),
                  ],
                ),
              ),
              pinned: true,
            ),
          ];
        },
        body: TabBarView(controller: _timeTabController, children: <Widget>[
          Container(
            height: 500,
            child: Center(child: Text("11")),
          ),
          Container(
            height: 500,
            child: Center(child: Text("22")),
          )
        ]),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return this.child;
  }

  @override
  double get maxExtent => this.child.preferredSize.height;

  @override
  double get minExtent => this.child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
