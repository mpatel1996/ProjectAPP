import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class StaffDetailPage extends StatefulWidget {
  StaffDetailPage({Key key, this.staff}) : super(key: key);

  final Map staff;
  _StaffDetailPageState createState() => _StaffDetailPageState();
}

class _StaffDetailPageState extends State<StaffDetailPage> {
  final DatabaseReference ref = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.staff['Name']),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text('Hello'),
            // Padding(
            //   padding:
            //       const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            //   child: CircleAvatar(
            //     maxRadius: 100,
            //     backgroundImage: NetworkImage('${widget.staff['Image']}'),
            //   ),
            // ),
            Image.network(
              widget.staff['Image'],
              fit: BoxFit.fill,
              height: 350,
              width: 350,
            ),
            SizedBox(
              height: 20,
            ),
            Text('${widget.staff['Name']}',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5,
            ),
            Text('Major: ${widget.staff['Major']}'),
            Text('Fact: ${widget.staff['Fact']}'),
          ],
        ),
      ),
    );
  }
}
