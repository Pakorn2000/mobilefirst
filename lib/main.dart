import 'package:flutter/material.dart';
import 'package:mobilefirst/screen/login.dart';
import 'package:mobilefirst/screen/register.dart';
import 'config/constant.dart';
import 'package:mobilefirst/index.dart';

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
        },
      home: Index(),
    );
  }
}
