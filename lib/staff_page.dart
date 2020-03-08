import 'package:flutter/material.dart';

class StaffPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Maybe instead of listView and hard coding all employee, lets try using listview itembuilder with List of name, Image and profile picture link. 
    // Can be imported through firebase. Also add onTap() state to open the employee into a new page.
    return ListView(
      padding: const EdgeInsets.all(8),
      // itemBuilder: (BuildContext context, int index) {
      // Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   mainAxisSize: MainAxisSize.max,
      children: <Widget>[

        // First Employee
        Container(
          padding: const EdgeInsets.all(10),
          height: 250,
          // color: Colors.green[100],
          child: Container(
            decoration: new BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: new BorderRadius.all(Radius.circular(10.0)),
            ),

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'My NAME',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ), // padding
                  Text(
                    'Testing',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ), // Text
                ], // Widget
              ),
            ), //Column
          ), //
        ),

        // Second Employee
        Container(
          padding: const EdgeInsets.all(10),
          child: Container(
            height: 250,
            decoration: new BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: new BorderRadius.all(Radius.circular(10.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Mihir',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    'Patel',
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  // Image.asset('lib/images/profile_picture.png'),  
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: CircleAvatar(
                      radius: 50.0,
                      backgroundImage: AssetImage('lib/images/profile_picture.png'),
                    ),
                  ),                
                ],
              ),
            ),
          ),
        ),
      ],
    );
    // },
    // separatorBuilder: (BuildContext context, int index) => const Divider(),
    // );
  }
}
