import 'package:flutter/material.dart';
import 'package:mobilefirst/config/constant.dart';
import 'package:mobilefirst/screen/adddata.dart';
import 'package:mobilefirst/screen/viewdata.dart';

class Store extends StatefulWidget {
  const Store({ Key? key }) : super(key: key);

  @override
  _StoreState createState() => _StoreState();
}

class _StoreState extends State<Store> {
   @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Store"),
        ),
        body: TabBarView(
          children: [
            Adddata(),
            ViewData(),
            
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.brown[800],
          child: TabBar(
            indicatorColor: Colors.redAccent,
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: "สั่งซื้อ",
              ),
              Tab(
                text: "ประวัติการสั่งซื้อ",
              )
              
            ],
          ),
        ),
      ),
    );
  }
}