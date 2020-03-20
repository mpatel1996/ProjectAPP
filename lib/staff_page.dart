import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import './staffDetail_page.dart';

class StaffPage extends StatelessWidget {
  final DatabaseReference ref = FirebaseDatabase.instance.reference();
  final employeeList = [];

  StaffPage() {
    getNames();
    
    ref.child("/employee").onChildChanged.listen((event) {
      getNames();
    });
    ref.child("/employee").onChildAdded.listen((event) {
      getNames();
    });
    ref.child("/employee").onChildRemoved.listen((event) {
      getNames();
    });
  }

  void getNames(){
    ref.child("/employee").once().then((ds) {
      employeeList.clear();
      ds.value.forEach((key, value) {
        employeeList.add(value);
      });

    }).catchError((e) {
      print('Failed to get Employee Names' + e.toString());
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: employeeList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StaffDetailPage(
                      staff: employeeList[index],
                    )));
              },
              title: Container(
                padding: const EdgeInsets.all(5),
                child: Container(
                  height: 200,
                  decoration: new BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: new BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Row(
                    children: <Widget>[
                      // Column(
                      //   children: <Widget>[
                      // Image.asset('lib/images/profile_picture.png',height: 100, width: 100,),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 20.0),
                        child: CircleAvatar(
                          maxRadius: 70,
                          backgroundImage:
                              NetworkImage('${employeeList[index]['Image']}'),
                        ),
                      ),
                      Flexible(
                        child: Text(
                          '${employeeList[index]['Name']}',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}

// void setNames() {
//   ref
//       .child("Eric/new")
//       .set({"name": "Mihir", "Type": "button added"}).then((res) {
//     print("Test added");
//   }).catchError((e) {
//     print("object" + e.toString());
//   });
// }
