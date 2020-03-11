import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class StaffPage extends StatelessWidget {
  final DatabaseReference ref = FirebaseDatabase.instance.reference();
  var employeeList = [];

  void setNames() {
    ref
        .child("Eric/new")
        .set({"name": "Mihir", "Type": "button added"}).then((res) {
      print("Test added");
    }).catchError((e) {
      print("object" + e.toString());
    });
  }

  void getNames() {
    print('Get Name Called');
    ref.child("/employee").once().then((ds) {
      // print(ds);
      // print(ds.value);
      // print(employeeList);
      // print('Employee list added');

      employeeList.clear();
      ds.value.forEach((key, value) {
        print(key);
        print(value);

        employeeList.add(value);
      });

      print(employeeList);
    }).catchError((e) {
      print('Failed to get Employee Names' + e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    // setNames();
    getNames();
    // Maybe instead of listView and hard coding all employee, lets try using listview itembuilder with List of name, Image and profile picture link.
    // Can be imported through firebase. Also add onTap() state to open the employee into a new page.
    return ListView.builder(
        // padding: const EdgeInsets.all(8),
        // Second Employee
        itemCount: employeeList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            padding: const EdgeInsets.all(10),
            // height: 250,
            child: Container(
              height: 260,
              decoration: new BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: new BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                children: <Widget>[
                  // Image.network(
                  //   'https://firebasestorage.googleapis.com/v0/b/polytransfer-8f708.appspot.com/o/Mihir2.jpg?alt=media&token=99bb7623-d851-46cf-bdd3-8b22fcc9d9db',
                  //   height: 150,
                  //   fit: BoxFit.fill,
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: CircleAvatar(
                      maxRadius: 80,
                      backgroundImage: NetworkImage('${employeeList[index]['image']}'),
                    ),
                  ),
                  
                  Text('${employeeList[index]['Name']}',
                      style: TextStyle(
                          fontSize: 24.0, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10.0),
                  ),
                  // Text('${employeeList[index]['Fact']}',
                  //     style: TextStyle(fontSize: 14.0),
                  //     textAlign: TextAlign.start,
                  //     overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          );
        });

    // Employee names taken after second employee Hard Coded.
    // Expanded(
    //   child: ListView.builder(
    //       shrinkWrap: true,
    //       itemCount: employeeList.length,
    //       itemBuilder: (BuildContext context, int index) {
    //         return Container(
    //           height: 50,
    //           child: Center(
    //             child: Text('Entry ${employeeList[index]['Name']}'),
    //           ),
    //         );
    //       }),
    // )

    // First Employee
    // Container(
    //   padding: const EdgeInsets.all(10),
    //   height: 250,

    //   child: Container(
    //     decoration: new BoxDecoration(
    //       color: Colors.lightBlueAccent,
    //       borderRadius: new BorderRadius.all(Radius.circular(10.0)),
    //     ),

    //     child: Padding(
    //       padding: const EdgeInsets.all(10.0),
    //       child: Column(
    //         children: <Widget>[
    //           Text(
    //             'My NAME',
    //             style:
    //                 TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
    //             textAlign: TextAlign.start,
    //             overflow: TextOverflow.ellipsis,
    //           ), // padding
    //           Text(
    //             'Testing',
    //             style: TextStyle(
    //               fontSize: 16.0,
    //             ),
    //           ), // Text
    //         ], // Widget
    //       ),
    //     ), //Column
    //   ), //
    // ),
  }
}
