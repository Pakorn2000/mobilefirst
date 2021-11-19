import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilefirst/config/constant.dart';

class Index extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('asset/image/cornflex.png'),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.78), BlendMode.dstIn),
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          children: [
            SizedBox(
              height: size.height * 0.1,
            ),
            Text(
              'CornFlex',
              style: GoogleFonts.pattaya(
                fontSize: 93,
                color: const Color(0xff000000),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              'คอนเฟลกคาราเมล',
              style: GoogleFonts.kanit(
                fontSize: 30,
                color: const Color(0xff000000),
                height: 1.2333333333333334,
              ),
              textHeightBehavior:
                  TextHeightBehavior(applyHeightToFirstAscent: false),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.3,
            ),

            // Image(
            //   image: NetworkImage(
            //       'https://images.unsplash.com/photo-1540151812223-c30b3fab58e6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'),
            // ),

            SizedBox(
              height: size.height * 0.02,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 24,
                ),
                primary: Colors.white,
                
                padding: EdgeInsets.all(20.0),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),
              ),
              child: Text('SIGN UP',
              style: GoogleFonts.roboto(
                color: const Color(0xff000000),
                fontWeight: FontWeight.bold 
              ),),
              onPressed: () {
                print("สมัครสมาชิก");
                Navigator.pushNamed(context, 'register');
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(

                  textStyle: TextStyle(
                    fontSize: 24,
                  ),
                  primary: pColor,
                  minimumSize: Size(0, 50),
                  padding: EdgeInsets.all(20.0),
                  shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(15.0),
                ),),
              child: Text(
                'LOGIN',
              style: GoogleFonts.roboto(
                color: const Color(0xff000000),
                fontWeight: FontWeight.bold 
              ),
              ),
              onPressed: () {
                print("LOGIN!!");
                Navigator.pushNamed(context, 'login');
              },
            ),
            
            
          ],
        ),
      ),
    );
  }
}
