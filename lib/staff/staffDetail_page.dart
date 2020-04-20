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
            (widget.staff['Image'] == null)
                ? Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20.0, vertical: 20.0),
                              child: Image.asset('lib/images/profile_picture.png', height: 100, width: 100,),
                            )
                : Image.network(
                    widget.staff['Image'],
                    fit: BoxFit.fill,
                    height: 350,
                    width: 350,
                  ),
<<<<<<< HEAD
<<<<<<< HEAD

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
=======
            SizedBox(
              height: 20,
            ),
            Text('${widget.staff['Name']}',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5,
            ),
            Text('Major: ${widget.staff['Major']}'),
            Text(
              'Fact: ${widget.staff['Fact']}',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Contact: ${widget.staff['Contact']}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
>>>>>>> parent of fcfe691... Version 1.0.0 to the Google playstore.
=======
            SizedBox(
              height: 20,
            ),
            Text('${widget.staff['Name']}',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 5,
            ),
            Text('Major: ${widget.staff['Major']}'),
            Text(
              'Fact: ${widget.staff['Fact']}',
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Contact: ${widget.staff['Contact']}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
>>>>>>> parent of fcfe691... Version 1.0.0 to the Google playstore.
      ),
    );
  }
}
