import 'package:flutter/material.dart';

class StaffPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      // itemBuilder: (BuildContext context, int index) {
        // Column(
        //   crossAxisAlignment: CrossAxisAlignment.stretch,
        //   mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              // height: 150,
              color: Colors.green[100],
              child: Column(                
                children: <Widget>[
                  Text(                    
                    'My NAME',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Testing',
                      style: TextStyle(fontSize: 16.0,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
               padding: const EdgeInsets.all(10),
              // height: 150,
              color: Colors.blue[100],
              child: Column(                
                children: <Widget>[
                  Text(                    
                    'My NAME 2',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Testing 2',
                      style: TextStyle(fontSize: 16.0,),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Container(
            padding: const EdgeInsets.all(10),
            // height: 150,
            color: Colors.green[100],
            child: Column(                
              children: <Widget>[
                Text(                    
                  'My NAME',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Testing',
                    style: TextStyle(fontSize: 16.0,),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

          ],
        );
      // },
      // separatorBuilder: (BuildContext context, int index) => const Divider(),
    // );
  }
}
