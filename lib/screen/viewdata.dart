import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ViewData extends StatefulWidget {
  const ViewData({Key? key}) : super(key: key);

  @override
  _ViewDataState createState() => _ViewDataState();
}

class _ViewDataState extends State<ViewData> {
  final dbfirebase = FirebaseDatabase.instance.reference().child('store');

  Future<void> updateData(String key) async {
    //dbfirebase.child(key).update({'status': ""});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Flexible(
      child: FirebaseAnimatedList(
          query: dbfirebase,
          itemBuilder: (context, snapshot, animation, index) {
            return Container(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Icon(Icons.shopping_bag),
                      radius: 30.0,
                    ),
                    title: Text(
                      '${snapshot.value['name']}',
                      style: TextStyle(fontSize: 22),
                    ),
                    subtitle: Row(
                      children: [
                        Text("จำนวน " + '${snapshot.value['count']} ห่อ | ',
                      style: TextStyle(fontSize: 18),),
                        Text('${snapshot.value['status']}',
                        style: TextStyle(fontSize: 18),),
                      ],
                    ),
                    trailing: Column(
                      children: [],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
