import 'package:flutter/material.dart';

//class ToastView extends StatelessWidget{
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return null;
//  }
//
//}
//



class ToastView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text('不透明度'),
//      ),
      body: new Center(
        child: new Opacity(
          opacity: 0.9,
          child:

//          new Container(
//            width: 250.0,
//            height: 100.0,
//            decoration: new BoxDecoration(
//              color: const Color(0xff000000),
//            ),
//          ),

           new  Container(
              width: 300.0,
              height: 150.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/img.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
            )

        ),
      ),
    );
  }
}
