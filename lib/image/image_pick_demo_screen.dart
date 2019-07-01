import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickDemoScreen extends StatefulWidget {
  @override
  _ImagePickDemoScreenState createState() => _ImagePickDemoScreenState();
}

class _ImagePickDemoScreenState extends State<ImagePickDemoScreen> {
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
        title: Text("相册选择"),
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
