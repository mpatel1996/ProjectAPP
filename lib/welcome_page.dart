import 'package:flutter/material.dart';


class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(begin: Alignment.topRight, colors: [
            Colors.blue[900],
            Colors.blue[800],
            Colors.blue[500], 
          ]),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height:80,
            ),
            Container(
              margin: const EdgeInsets.all(30.0),
              // padding: const EdgeInsets.all(10.0),
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.all(Radius.circular(10.0)),
                 color: Colors.blue[400],
                 ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'PolyTransfer Connect',
                      style: TextStyle(                      
                        color: Colors.yellow,
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Text(
                          'Cal Poly Pomona Transfer Program App',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          textAlign: TextAlign.center,
                        ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
