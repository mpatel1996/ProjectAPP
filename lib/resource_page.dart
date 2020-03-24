import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import './resourceDetail_page.dart';

class ResourcePage extends StatelessWidget {
  final DatabaseReference ref = FirebaseDatabase.instance.reference();
  final resourceList = [];

  ResourcePage() {
    getNames();

    ref.child("/Partners").onChildChanged.listen((event) {
      getNames();
    });
    ref.child("/Partners").onChildAdded.listen((event) {
      getNames();
    });
    ref.child("/Partners").onChildRemoved.listen((event) {
      getNames();
    });
  }

  void getNames() {
    ref.child("/Partners").once().then((ds) {
      resourceList.clear();
      ds.value.forEach((key, value) {
        resourceList.add(value);
      });
    }).catchError((e) {
      print('Failed to get Employee Names' + e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(20),
        // Generate 100 widgets that display their index in the List.
        children: List.generate(resourceList.length, (index) {
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RecourceDetailPage(
                            resource: resourceList[index],
                          )));
            },
            title: Container(
              decoration: new BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: new BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: CircleAvatar(
                      maxRadius: 50,
                      backgroundImage:
                          NetworkImage('${resourceList[index]['Image']}'),
                    ),
                  ),
                  Text(
                    '${resourceList[index]['Name']}',
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
