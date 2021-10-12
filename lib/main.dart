import 'package:flutter/material.dart';
import 'package:mobilefirst/screen/myimage.dart';
import 'package:mobilefirst/screen/location.dart';
import 'package:mobilefirst/screen/login.dart';
import 'package:mobilefirst/screen/register.dart';
import 'package:mobilefirst/screen/video.dart';
import 'config/constant.dart';
import 'package:mobilefirst/index.dart';
import 'package:mobilefirst/screen/dashboard.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KMUTNB',
      theme: ThemeData(
        primaryColor: pColor,
        secondaryHeaderColor: sColor,
        ),
        routes: {
          'login': (context) => Login(),
          'register': (context)=> Register(),
          'dashboard': (context) => Dashboard(),
          'video': (context) => Video(),
          'myimage': (context) => MyImage(),
          'location': (context) => Location(),
        },
      home: Index(),
    );
  }
}

