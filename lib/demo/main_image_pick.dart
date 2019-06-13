import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<File> _imageFile;

  void _selectedImage() {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: ImageSource.gallery);
      print(_imageFile);
    });
  }

  Widget _previewImage() {
    return FutureBuilder<File>(
        future: _imageFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return new ClipOval(
              child: SizedBox(
                  width: 70.0,
                  height: 70.0,
                  child: Image.file(snapshot.data, fit: BoxFit.cover)),
            );
          } else {
            return new Image.asset("images/delete.png",
                height: 70.0, width: 70.0);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          _previewImage(),
          FlatButton(
            onPressed: (){
              _selectedImage();
            },
            child: Text("选择照片"),
          )
        ],
      ),
    );
  }
}
