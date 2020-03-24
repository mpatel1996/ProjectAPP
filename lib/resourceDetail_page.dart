import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class RecourceDetailPage extends StatefulWidget {
  RecourceDetailPage({Key key, this.resource}) : super(key: key);

  final Map resource;
  _RecourceDetailPageState createState() => _RecourceDetailPageState();
  
}

class _RecourceDetailPageState extends State<RecourceDetailPage> {
  final DatabaseReference ref = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.resource['Name']),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,          
          children: <Widget>[            
            (widget.resource['Image'] == null)
                ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              child: Image.asset('', height: 100, width: 100,),
                            )
                : Image.network(
                    widget.resource['Image'],
                    fit: BoxFit.fill,
                    height: 350,
                    width: 350,
                  ),
            SizedBox(
              height: 20,
            ),
            Text('${widget.resource['Name']}',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Text(
                'Location: ${widget.resource['Location']}',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Contact: ${widget.resource['Contact']}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
