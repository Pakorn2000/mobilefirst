import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  dynamic latitude = "";
  dynamic longitude = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();
  }

  Future<void> getLocation() async {
    // คำสั่งการดึงค่าตำแหน่ง ละติจูด และลองจิจูด
    var location = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // แปลง ละติจูด กับ ลองจิจูดเป็นสถานที่
    var address = await placemarkFromCoordinates(13.736717, 100.523186);
    print(address);

    setState(() {
      latitude = '${location.latitude}';
      longitude = '${location.longitude}';
    });

    print(location);
    print(location.latitude);
    print(location.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ละติจูด ' + latitude,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Text(
              'ลองจิจูด' + longitude,
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}