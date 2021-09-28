import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mobilefirst/model/activity.dart';

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
    print("hello world");

    // กำหนด Path
    var url = Uri.parse("https://www.boredapi.com/api/activity");

    // call api
    var response = await http.get(url);
    // การสั่งให้แอปวาดหน้าจอใหม่ โดยการใช้ funtion setState

    setState(() {
      // แปลงจาก json => object
      data = cedFromJson(response.body);

      // การเข้าถึงข้อมูลใน object
      print(data.activity);
      print(data.type);
      print(data.participants);
      print(data.price);
      print(data.link);
      print(data.key);
      print(data.accessibility);
    });

    // แสดงสถานะของcode
    print(response.statusCode);

    // แสดงข้อมูล
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.api_sharp),
              SizedBox(
                width: 10,
              ),
              Text('DashBoard'),
            ],
          ),
        ),
        body: Column(
          children: [
            Text(
              data?.activity ?? 'กำลังโหลดข้อมูล',
              ),
            Text(data?.type ?? ''),
            Text('${data?.participants ?? ""}'),
            Text('${data?.price ?? ""}'),
          ],
        ),
      ),
    );
  }
}
