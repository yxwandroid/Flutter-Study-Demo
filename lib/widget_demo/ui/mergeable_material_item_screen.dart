import 'package:flutter/material.dart';

class MergeableMaterialItemScreen extends StatefulWidget {
  _MergeableMaterialItemState createState() => _MergeableMaterialItemState();
}

class _MergeableMaterialItemState extends State<MergeableMaterialItemScreen> {
  final List<MergeableMaterialItem> items = <MergeableMaterialItem>[];
  bool currIndex = false;
  int currIndexNum = 1;

  _isChildExpanded() {
    setState(() {
      currIndex ? currIndex = false : currIndex = true;
      currIndexNum++;
    });
  }

  @override
  Widget build(BuildContext context) {
    items.add(

        //class MaterialSlice extends MergeableMaterialItem
        MaterialSlice(
            key: ValueKey<int>(currIndexNum),
            child: Column(children: <Widget>[
              // header,
              AnimatedCrossFade(
                firstChild: Container(
                  height: 20.0,
                  width: 20.0,
                  color: Colors.green,
                ),
                secondChild: Container(
                  height: 20.0,
                  width: 200.0,
                  color: Colors.red,
                ),
                crossFadeState: currIndex
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstCurve:
                    const Interval(0.0, 0.6, curve: Curves.fastOutSlowIn),
                secondCurve:
                    const Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
                sizeCurve: Curves.fastOutSlowIn,
                duration: Duration(microseconds: 6),
              )
            ])));

    return Column(
      children: <Widget>[
        MergeableMaterial(hasDividers: true, children: items),
        RaisedButton(
          child: Text("点击添加"),
          onPressed: () {
            _isChildExpanded();
          },
        )
      ],
    );
  }
}
