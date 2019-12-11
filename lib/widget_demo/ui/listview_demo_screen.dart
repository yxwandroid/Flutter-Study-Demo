import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewDemoScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ListViewDemoScreenState();
  }
}


class ListViewDemoScreenState extends State<ListViewDemoScreen>{
   List<String> items= List();


   @override
  void initState() {
    super.initState();

    for(int  i=0;i<20;i++){
      items.add(i.toString());
    }

  }


   Widget getItemView(int postion) {
     return new ListTile(
       onTap: () {
         Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
           print("wilson 点击的数据");
           print(postion);
         }));
       },
       leading: new CircleAvatar(
         radius: 20.0,
         backgroundImage: new NetworkImage(
             'https://upload.jianshu.io/users/upload_avatars/7700793/dbcf94ba-9e63-4fcf-aa77-361644dd5a87?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240'),
       ),
       title: new Text("班主任"),
       subtitle: new Text("你高考考了满分你知道吗？"),
       trailing: new Container(
         child: Column(
           children: <Widget>[
             new Container(
               margin: EdgeInsets.fromLTRB(0, 12, 5, 0),
               child: Text(

                 "9:00",
                 style: TextStyle(fontSize: 12),
               ),
             ),
             new Container(
               margin: EdgeInsets.fromLTRB(0, 2, 5, 0),
               width: 20,
               height: 20,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10), //圆角
                 color: Colors.red, //圆点背景颜色
               ),
               child: new Text(
                 "1",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                   fontSize: 16,
                 ),
               ),
             )
           ],
         ),
       ),
     );
   }

   @override
  Widget build(BuildContext context) {
    final title = "Dismissing Items";
    return Scaffold(
      appBar: new AppBar(
        title: new Text(title),
      ),
      body: new ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          //通过拖动来删除小部件的widget
          return new Dismissible(
            //如果Dismissible是一个列表项 它必须有一个key 用来区别其他项
              key: new Key(item),
              //在child被取消时调用
              onDismissed: (direction) {
                items.removeAt(index);
                //这个和Android的SnackBar差不多
                Scaffold.of(context).showSnackBar(
                    new SnackBar(content: new Text("$item dismissed")));
              },
              //如果指定了background 他将会堆叠在Dismissible child后面 并在child移除时暴露
              background: new Container(
                color: Colors.red,
              ),
              child: getItemView(index));
        },
      ),
    );
  }

}