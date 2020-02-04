import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override 
  Widget build(BuildContext context){
    return MaterialApp(
      title: "PolyTransfer Connect",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatefulWidget{
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>{
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('PolyTransfer'),
      ),
      body: Center(
        child: Text('My Page'),
      ),    
       drawer: Drawer(
         child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),

            ListTile(
              title: Text('Home'),
              onTap: (){
                // Home widgets
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text('Events'),
              onTap: (){
                // Events Widget
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: Text('About Us'),
              onTap: (){
                // Events Widget
                Navigator.pop(context);
              },
            ),

             ListTile(
              title: Text('Our Staff'),
              onTap: (){
                // Home widgets
                Navigator.pop(context);
              },
            ),

             ListTile(
              title: Text('FAQ'),
              onTap: (){
                // Home widgets
                Navigator.pop(context);
              },
            ),

          ],
         ),
       ),
    );
  }
}