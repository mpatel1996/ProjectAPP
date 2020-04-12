import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class StaffDetailPage extends StatefulWidget {
  StaffDetailPage({Key key, this.staff}) : super(key: key);

  final Map staff;

  _StaffDetailPageState createState() => _StaffDetailPageState();
}

class _StaffDetailPageState extends State<StaffDetailPage> {
  final DatabaseReference ref = FirebaseDatabase.instance.reference();

  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> send() async {
    final Email email = Email(
      body: _bodyController.text,
      subject: _subjectController.text,
      recipients: ['${widget.staff['Contact'].toString()}'],
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(platformResponse),
    ));
  }

  @override
  Widget build(BuildContext context) {
    double cWidth = MediaQuery.of(context).size.width * 0.55;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.staff['Name']),
      ),
      body: ListView(
        children: [
          Column(
            children: <Widget>[
              // Image and Info
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Image
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          (widget.staff['Image'] == null)
                              ? Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 20.0),
                                  child: Image.asset(
                                    'lib/images/profile_picture.png',
                                    height: 100,
                                    width: 100,
                                  ),
                                )
                              : Image.network(
                                  widget.staff['Image'],
                                  fit: BoxFit.fill,
                                  height: 150,
                                  width: 150,
                                ),
                        ]),
                  ),

                  // Info
                  Container(
                    width: cWidth,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('${widget.staff['Name']}',
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          (widget.staff['Major'] != null)
                              ? Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Major: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                        text: '${widget.staff['Major']}',
                                      ),
                                    ],
                                  ),
                                )
                              : Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'Position: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                        text: '${widget.staff['Position']}',
                                      ),
                                    ],
                                  ),
                                ),
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Fact: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: '${widget.staff['Fact']}',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Contact: ',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: '${widget.staff['Contact']}',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // Email me page
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Padding(
                        //   padding: EdgeInsets.all(8.0),
                        //   child: TextField(
                        //     controller: widget.staff['Contact'],
                        //     decoration: InputDecoration(
                        //       border: OutlineInputBorder(),
                        //       labelText: 'Recipient',
                        //     ),
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _subjectController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Subject',
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: TextField(
                            controller: _bodyController,
                            minLines: 10,
                            maxLines: 100,
                            decoration: InputDecoration(
                                labelText: 'Body',
                                border: OutlineInputBorder()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: send,
        child: Text("Send"),
      ),
    );
  }
}

// FlatButton(
//   color: Colors.blue,
//   textColor: Colors.white,
//   disabledColor: Colors.grey,
//   disabledTextColor: Colors.black,
//   padding: EdgeInsets.all(8.0),
//   splashColor: Colors.blueAccent,
//   onPressed: send,
//   child: Text(
//     "Email Me",
//     style: TextStyle(fontSize: 20.0),
//   ),
// )
