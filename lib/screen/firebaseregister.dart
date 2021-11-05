import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobilefirst/config/constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobilefirst/screen/firebaselogin.dart';

class FirebaseRegister extends StatefulWidget {
  const FirebaseRegister({Key? key}) : super(key: key);

  @override
  _FirebaseRegisterState createState() => _FirebaseRegisterState();
}

class _FirebaseRegisterState extends State<FirebaseRegister> {
  var name, email, password;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtName(),
                txtEmail(),
                txtPassword(),
                btnSubmit(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtName() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        style: TextStyle(
          color: sColor,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: 'Name:',
          icon: Icon(Icons.approval),
          hintText: 'Input your name',
        ),
        validator: (val) {
          if (val!.length < 6) {
            return 'กรุณากรอกข้อมูลมากกว่า 6 ตัวอักษร';
          }
        },
        onSaved: (val) {
          name = val;
        },
      ),
    );
  }

  Widget txtEmail() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        style: TextStyle(
          color: sColor,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: 'Email:',
          icon: Icon(Icons.email),
          hintText: 'Input your email',
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (!(value!.contains('@'))) {
            return 'กรุณากรอกข้อมูลตามรูปอีเมลด้วย';
          } else if (!(value.contains('.'))) {
            return 'กรุณากรอกข้อมูลตามรูปอีเมลด้วย';
          }
        },
        onSaved: (value) {
          email = value;
        },
      ),
    );
  }

  Widget txtPassword() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        style: TextStyle(
          color: sColor,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: 'Password:',
          icon: Icon(Icons.lock),
          hintText: 'Input your password',
        ),
        obscureText: true,
        onSaved: (value) {
          password = value;
        },
      ),
    );
  }

  Widget btnSubmit() {
    return ElevatedButton(
      child: Text('Submit'),
      onPressed: () {
        if(formkey.currentState!.validate()){
            formkey.currentState!.save();
            registerFirebase();
        }
      },

    );
  }
  Future<void> registerFirebase() async {
    try {
      // สร้าง User ด้วย Email and Password
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((response) {
        // print(response);
        setupProfile();
        // การสั่งให้มันเปลี่ยนไปหน้าใหม่
        MaterialPageRoute materialPageRoute = MaterialPageRoute(
            builder: (BuildContext context) => FirebaseLogin());
        Navigator.of(context).pushAndRemoveUntil(
            materialPageRoute, (Route<dynamic> route) => false);
      });
    } catch (e) {
      print(e);
      var error = '${e}';
      myAlert(error);
    }
  }

  Future<void> setupProfile() async {
    var user = FirebaseAuth.instance.currentUser;
    await user!.sendEmailVerification();

    if (user != null) {
      await user.updateDisplayName("anutchai").catchError((onError) {
        print(onError);
      });
      await user.updatePhotoURL("www.google.com");
      print(user.displayName);
    }
  }

  void myAlert(dynamic msg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: ListTile(
              leading: Icon(
                Icons.alarm_on,
                color: Colors.red,
                size: 48,
              ),
              title: Text("พบข้อผิดพลาด"),
            ),
            content: Text(msg),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"),
              ),
            ],
          );
        });
  }
}