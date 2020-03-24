import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import './staff_page.dart';
import './resource_page.dart';
import './events_page.dart';
import './faq_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int _selectedPage = 3;
  String title = "Events";
  final _pageOptions = [    
    EventPage(),
    StaffPage(),
    ResourcePage(),
    FaqPage(),
  ];

  final _titleOption = [    
    "Events",
    "Staff and Peer Mentors",
    "Campus Resources",
    "FAQ Page",
  ];

  final DatabaseReference ref = FirebaseDatabase.instance.reference();
  var employeeList = [];

  void getNames() {
    print('Get Name Called');
    ref.child("/employee").once().then((ds) {
      employeeList.clear();
      ds.value.forEach((key, value) {
        print(key);
        print(value);
        employeeList.add(value);
      });

      // print(employeeList);
    }).catchError((e) {
      print('Failed to get Employee Names' + e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PolyTransfer Connect",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
              title = _titleOption.elementAt(index);
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today, color: Color.fromARGB(225, 16, 126, 1),), 
              title: Text('Event', style: TextStyle(color: Color.fromARGB(225, 16, 126, 1),),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Color.fromARGB(225, 16, 126, 1),), 
              title: Text('Staff', style: TextStyle(color: Color.fromARGB(225, 16, 126, 1),),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.mood, color: Color.fromARGB(225, 16, 126, 1),), 
              title: Text('Partners', style: TextStyle(color: Color.fromARGB(225, 16, 126, 1),),),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.help_outline, color: Color.fromARGB(225, 16, 126, 1),), 
              title: Text('FAQ', style: TextStyle(color: Color.fromARGB(225, 16, 126, 1),),),
            ),
          ],
        ),
      ),
    );
  }
}
