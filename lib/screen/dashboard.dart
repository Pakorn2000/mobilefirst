import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:mobilefirst/model/activity.dart';
import 'dart:math';

import 'package:path/path.dart';
var data;

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}


class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    super.initState();
    callActivity();
  }

  Future<void> callActivity() async {
    

    // กำหนด Path
    var url = Uri.parse("https://www.boredapi.com/api/activity");

    // call api
    var response = await http.get(url);
    // การสั่งให้แอปวาดหน้าจอใหม่ โดยการใช้ funtion setState

    setState(() {
      // แปลงจาก json => object
      data = cedFromJson(response.body);

      // การเข้าถึงข้อมูลใน object
      // print(data.activity);
      // print(data.type);
      // print(data.participants);
      // print(data.price);
      // print(data.link);
      // print(data.key);
      // print(data.accessibility);
    });

    // แสดงสถานะของcode
    //print(response.statusCode);

    // แสดงข้อมูล
    //print(response.body);
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

 

    return Scaffold(
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.brown[800],
                ),
                child: Stack(children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: CircleAvatar(
                      //ใส่รูป
                      backgroundImage: NetworkImage(
                          'https://i.redd.it/a1zcxisgjls71.png'),
                      radius: 50.0,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Conflex App 1.0',
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ]),
              ),
              // ListTile(
              //   title: Text(
              //     'Video',
              //   style: TextStyle(fontSize: 24,)
              //   ,),
              //   leading: Icon(Icons.video_collection),
              //   onTap: (){
              //     print('Menu Video');
              //     Navigator.pushNamed(context, 'video');
              //   },
              //),
              // ListTile(
              //   title: Text(
              //     'Image',
              //   style: TextStyle(fontSize: 24,)
              //   ),
              //   leading: Icon(Icons.image),
              //   onTap: (){
              //     print('Menu Image');
              //     Navigator.pushNamed(context, 'myimage');
              //   },
              // ),
              // ListTile(
              //   title: Text(
              //     'Location',
              //   style: TextStyle(fontSize: 24,)
              //   ),
              //   leading: Icon(Icons.map),
              //   onTap: (){
              //     print('Menu Location');
              //     Navigator.pushNamed(context, 'location');
              //   },
              // ),
              // ListTile(
              //   title: Text(
              //     'Store',
              //   style: TextStyle(fontSize: 24,)
              //   ),
              //   leading: Icon(Icons.store),
              //   onTap: (){
              //     print('Menu Store');
              //     Navigator.pushNamed(context, 'store');
              //   },
              // ),
              ListTile(
                title: Text('Logout',
                    style: TextStyle(
                      fontSize: 24,
                    )),
                leading: Icon(Icons.exit_to_app),
                onTap: () {
                  print('ออกจากระบบ');
                  Fluttertoast.showToast(msg: 'ออกจากระบบ');
                  logout();
                  Navigator.of(context).pop();
                  Navigator.pushNamed(context, 'index');
                },
              ),
            ],
          ),
        ),
        
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //Icon(Icons.api_sharp),

              Text('Welcome'),
            ],
          ),
        ),
        
        body: ListView(
          children: <Widget>[
            
             SizedBox(
                  height: size.height * 0.1,
                ),
             Text('มาเริ่มสั่งซื้อกันเถอะ',
             style: GoogleFonts.pattaya(
                fontSize: 48,
                color: const Color(0xff000000),
              ),
              
              textAlign: TextAlign.center,
             ),
              SizedBox(
                  height: size.height * 0.1,
                ),
             Image(
              image: NetworkImage(
                  'https://krua.co/wp-content/uploads/2020/06/SlideBanner_RB0130_1140x507.jpg'),
            ), 
          


            // Text(
            //   data?.activity ?? 'กำลังโหลดข้อมูล',
            // ),
            // Text(data?.type ?? ''),
            // Text('${data?.participants ?? ""}'),
            // Text('${data?.price ?? ""}'),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
      onPressed: () {
        Navigator.pushNamed(context, 'store');
      },
        label: const Text('สั่งซื้อ'),
        icon : const Icon(Icons.shopping_cart),
        
          backgroundColor: Colors.green,
        ),
      );
      
    
  }
}
