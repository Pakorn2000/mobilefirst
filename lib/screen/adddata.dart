import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobilefirst/config/constant.dart';
import 'package:mobilefirst/screen/dashboard.dart';

class Adddata extends StatefulWidget {
  const Adddata({ Key? key }) : super(key: key);

  @override
  _AdddataState createState() => _AdddataState();
}

class _AdddataState extends State<Adddata> {
  // ประกาศตัวแปรสำหรับการเพิ่มสินค้า
  String? name, caddress, count, ordernote, status = 'ได้รับออเดอร์แล้ว';
  final formKey = GlobalKey<FormState>();
  //สร้าง object โดยกำหนดไป child ชื่อ store
  final dbfirebase = FirebaseDatabase.instance.reference().child('store');

  Future<void> createData() async{
     dbfirebase
     .push()
     .set({
       'name': name, 
       'caddress': caddress,
       'count' : count, 
       'status': status
       })
       .then((value) => 
        Fluttertoast.showToast(
        msg : ('ยืนยันคำสั่งซื้อแล้ว'),
        gravity: ToastGravity.SNACKBAR)
        )
       .catchError((onError){
         print(onError);
          Fluttertoast.showToast(
            msg: onError.message,
            gravity: ToastGravity.SNACKBAR);
       });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                txtName(),
                txtCount(),
                customerAddress(),
                txtOrdernote(),
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
      margin: EdgeInsets.fromLTRB(15, 20, 15, 10),
      child: TextFormField(
        style: TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: 'ชื่อลูกค้า :',
          icon: Icon(Icons.account_circle_rounded),
          hintText: 'โปรดใส่ชื่อลูกค้า',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาใส่ชื่อด้วย';
          } else if (value.length < 2) {
            return 'กรุณาใส่ข้อมูลมากกว่า 2 ตัวอักษร';
          }
        },
        onSaved: (value) {
          name = value;
        },
      ),
    );
  }
  Widget customerAddress(){
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextFormField(
        style: TextStyle(
          fontSize: 22,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: 'ที่อยู่ในการจัดส่ง :',
          icon: Icon(Icons.account_circle_rounded),
          hintText: 'ใส่ที่อยู่',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณาใส่ที่อยู่';
          } else if (value.length < 2) {
            return 'กรุณาใส่ข้อมูลมากกว่า 2 ตัวอักษร';
          }
        },
        onSaved: (value) {
          caddress = value;
        },
    ),
    );
  }
  Widget txtCount() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: 'จำนวน:',
          icon: Icon(Icons.price_check),
          hintText: 'ใส่จำนวนที่ต้องการซื้อ',
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกจำนวนี่ต้องการซื้อ';
          } else if (value.length <=2 ) {
            return 'กรุณาใส่จำนวนไม่เกิน 2 ตัวอักษร';
          }
        },
        onSaved: (value) {
          count = value;
        },
      ),
    );
  }

  Widget txtOrdernote() {
    return Container(
      margin: EdgeInsets.fromLTRB(15, 0, 15, 30),
      child: TextFormField(
        style: TextStyle(
          fontSize: 24,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          labelText: 'คำอธิบาย:',
          icon: Icon(Icons.description),
          hintText: 'ใส่คำบรรบายสินค้า',
        ),
        onSaved: (value) {
          ordernote = value;
        },
      ),
    );
  }

  Widget btnSubmit() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          textStyle: TextStyle(
                    fontSize: 24,
                  ),
                  primary: pColor,
                  minimumSize: Size(350, 0),
                  padding: EdgeInsets.all(20.0),
          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: pColor)
                        
                        ),
          
        ),
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            print(name);
            print(caddress);
            print(count);
            print(ordernote);
            print(status);
            createData();

            formKey.currentState!.reset();
          }
        },
        child: Text('Save',style: TextStyle( color:Colors.brown[900],),),
      );
}