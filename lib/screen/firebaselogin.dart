

import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilefirst/config/constant.dart';
import 'package:mobilefirst/screen/dashboard.dart';


class FirebaseLogin extends StatefulWidget {
  const FirebaseLogin({ Key? key }) : super(key: key);

  @override
  _FirebaseLoginState createState() => _FirebaseLoginState();
}

class _FirebaseLoginState extends State<FirebaseLogin> {
  var email, password;
  final formKey = GlobalKey<FormState>();

  Future <void> checkUser() async {
    try {
      await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value){
          print('success');
      // การสั่งให้มันเปลี่ยนไปหน้าใหม่ 
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => Dashboard());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);

        }).catchError((onError){
          //print(onError);
          Fluttertoast.showToast(
            msg: onError.message,
            gravity: ToastGravity.SNACKBAR
            );
        });

    }catch (e){
     // print(e);
      
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Container(
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: size.height * 0.03,
                ),
                Text(
                  'Login',
                style: GoogleFonts.staatliches(
                fontSize: 60,
                color: const Color(0xff000000),
                ),
                  
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  width: size.width * 0.9,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.email,
                        color: Colors.brown[500],
                        size: size.height * 0.05,
                      ),
                      hintText: "อีเมล์",
                    ),
                    onSaved: (value) {
                      email = value!.trim();
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.04,
                ),
                Container(
                  width: size.width * 0.9,
                  child: TextFormField(
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.lock_outline_rounded,
                        color: Colors.brown[500],
                        size: size.height * 0.05,
                      ),
                      hintText: "รหัสผ่าน",
                    ),
                    onSaved: (value) {
                      password = value!.trim();
                    },
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  width: size.width * 0.8,
                  height: size.height * 0.08,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: pColor)),
                    onPressed: () {
                      formKey.currentState!.save();
                      print('login');
                      checkUser();

                    },
                    color: pColor,
                    textColor: Colors.brown[900],
                    child: Text("login".toUpperCase(),
                        style: TextStyle(fontSize: 16)),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}