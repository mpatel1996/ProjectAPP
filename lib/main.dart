import 'package:flutter/material.dart';

import './staff/staff_page.dart';
import './resources/resource_page.dart';
import './events/events_page.dart';
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

  var colorDefault = Color.fromARGB(225, 16, 126, 1);
  var colorSelected = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //title: "PolyTransfer Connect",
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
              icon: Icon(
                Icons.event,
                color: (_selectedPage == 0) ? colorSelected : colorDefault,
              ),
              title: Text(
                'Event',
                style: TextStyle(
                  color: (_selectedPage == 0) ? colorSelected : colorDefault,
                ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: (_selectedPage == 1) ? colorSelected : colorDefault,
              ),
              title: Text(
                'Staff',
                style: TextStyle(
                  color: (_selectedPage == 1) ? colorSelected : colorDefault,
                ),
              ),
            ),
            BottomNavigationBarItem(
<<<<<<< HEAD
              icon: Icon(
                Icons.star,
                color: (_selectedPage == 2) ? colorSelected : colorDefault,
              ),
              title: Text(
                'Resources',
                style: TextStyle(
                  color: (_selectedPage == 2) ? colorSelected : colorDefault,
                ),
              ),
=======
              icon: Icon(Icons.mood, color: Color.fromARGB(225, 16, 126, 1),), 
              title: Text('Partners', style: TextStyle(color: Color.fromARGB(225, 16, 126, 1),),),
<<<<<<< HEAD
>>>>>>> parent of fcfe691... Version 1.0.0 to the Google playstore.
=======
>>>>>>> parent of fcfe691... Version 1.0.0 to the Google playstore.
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.help_outline,
                color: (_selectedPage == 3) ? colorSelected : colorDefault,
              ),
              title: Text(
                'FAQ',
                style: TextStyle(
                  color: (_selectedPage == 3) ? colorSelected : colorDefault,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
