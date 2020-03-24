import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class EventPage extends StatelessWidget {
  final DatabaseReference ref = FirebaseDatabase.instance.reference();
  final eventList = [];

  EventPage() {
    getEvents();
    
    ref.child("/Events").onChildChanged.listen((event) {
      getEvents();
    });
    ref.child("/Events").onChildAdded.listen((event) {
      getEvents();
    });
    ref.child("/Events").onChildRemoved.listen((event) {
      getEvents();
    });
  }
  getEvents() {
    ref.child("/Events").once().then((ds) {
      eventList.clear();
      ds.value.forEach((key, value) {
        eventList.add(value);
      });
    }).catchError((e) {
      print('Failed to get Employee Names' + e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Container(
              padding: const EdgeInsets.all(3),
              height: 100,
              decoration: new BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: new BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.all(5)),
                  Text(
                    '${eventList[index]['Name']}',
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${eventList[index]['Place']}',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    '${eventList[index]['Time']}',
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
