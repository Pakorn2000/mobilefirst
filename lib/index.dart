import 'package:flutter/material.dart';
import 'package:mobilefirst/config/constant.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.blue[50],
        child: ListView(
          children: [
            Image.asset(
              "asset/image/logo_kmutnb.png",
              width: size.width * 0.2,
              height: size.height * 0.2,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Welcome to KMUTNB",
              style: TextStyle(
                fontSize: 32,
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Image(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1540151812223-c30b3fab58e6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  primary: Colors.amber[900],
                  padding: EdgeInsets.all(20.0),
                  shape: StadiumBorder()),
              child: Text('LOGIN'),
              onPressed: () {
                print("LOGIN!!");
                Navigator.pushNamed(context, 'login');
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 20,
                  ),
                  primary: pColor,
                  padding: EdgeInsets.all(20.0),
                  shape: StadiumBorder()),
              child: Text('Sign Up'),
              onPressed: () {
                print("สมัครสมาชิก");
                Navigator.pushNamed(context, 'register');
              },
            ),

          ],
        ),
      ),
    );
  }
}
