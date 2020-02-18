import 'package:flutter/material.dart';


import './staff_page.dart';
import './aboutUs_page.dart';
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
  final _pageOptions = [
    EventPage(),
    StaffPage(),
    AboutUsPage(),
    FaqPage(),
  ];

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
          title: Text('PolyTransfer Connect'),
        ),
        body: _pageOptions[_selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
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
              title: Text('About Us', style: TextStyle(color: Color.fromARGB(225, 16, 126, 1),),),
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
