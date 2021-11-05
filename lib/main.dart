import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobilefirst/screen/firebaselogin.dart';
import 'package:mobilefirst/screen/firebaseregister.dart';
import 'package:mobilefirst/screen/myimage.dart';
import 'package:mobilefirst/screen/location.dart';
import 'package:mobilefirst/screen/login.dart';
import 'package:mobilefirst/screen/store.dart';
//import 'package:mobilefirst/screen/register.dart';
import 'package:mobilefirst/screen/video.dart';
import 'config/constant.dart';
import 'package:mobilefirst/index.dart';
import 'package:mobilefirst/screen/dashboard.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          'login': (context) => FirebaseLogin(),
          'register': (context)=> FirebaseRegister(),
          'dashboard': (context) => Dashboard(),
          'video': (context) => Video(),
          'myimage': (context) => MyImage(),
          'location': (context) => Location(),
          'store': (context) => Store(),


        },
      home: Index(),
    );
  }
}

