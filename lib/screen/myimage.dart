//import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyImage extends StatefulWidget {
  const MyImage({Key? key}) : super(key: key);

  @override
  _MyImageState createState() => _MyImageState();
}


class _MyImageState extends State<MyImage> {
  dynamic file;

  Future<void> openCamera() async{
    var picker = ImagePicker();
    var photo = await picker.pickImage(source: ImageSource.camera);
    
    setState(() {
      file = File(photo!.path);
    });
    
    print(file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Center(child: file == null ? Text("Select Image") : Image.file(file),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        print('open camera');
        openCamera();
      },
      child: Icon(Icons.camera),
      ),
    );
  }
}
