import 'package:flutter/material.dart';
import 'package:mobilefirst/config/constant.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var name, surname, email, password;
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Form(
          key: formkey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtname(),
                txtSurname(),
                txtEmail(),
                txtPassword(),
                btnSubmit()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget txtname() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        style: TextStyle(
          color: pColor,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: "Name:",
          icon: Icon(Icons.add_circle),
          hintText: "Input yor name",
        ),
        validator: (val) {
          if (val!.length < 6) {
            return "กรุณากรอกข้อมูลมากกว่า 6 ตัวอักษร";
          }
        },
        onSaved: (val) {
          name = val;
        },
      ),
    );
  }

  Widget txtSurname() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        style: TextStyle(
          color: pColor,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: "Lastname:",
          icon: Icon(Icons.add_circle),
          hintText: "Input yor Lastname",
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return "กรุณากรอกข้อมูล";
          } else if (value.length < 3) {
            return "กรุณากรอกข้อมูลมากกว่า 3 ตัวอักษร";
          }
        },
        onSaved: (value) {
        surname = value!.trim();
        },
      ),
    );
  }

  Widget txtEmail() {
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 30, 10),
      child: TextFormField(
        style: TextStyle(
          color: pColor,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: "Email:",
          icon: Icon(Icons.email),
          hintText: "Input yor Email",
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          if (!(value!.contains('@'))) {
            return "กรอกในรูปแบบอีเมล์";
          } else if (!(value.contains('.'))) {
            return "กรอกในรูปแบบอีเมล์";
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
          color: pColor,
          fontSize: 24,
        ),
        decoration: InputDecoration(
          labelText: "Password:",
          icon: Icon(Icons.password),
          hintText: "Input yor Password",
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
        if (formkey.currentState!.validate()) {
          formkey.currentState!.save();
    //      print("ชื่อ $name นามสกุล: $surname อีเมล์: $email Password: $password");
            print("ชื่อ $name");
            print("นามสกุล: $surname");
            print("อีเมล์: $email");
            print("Password: $password");
        }
      },
    );
  }
}
