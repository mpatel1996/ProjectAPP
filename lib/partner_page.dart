import 'package:flutter/material.dart';

class PartnerPage extends StatefulWidget {
  PartnerPage({Key key}) : super(key: key);
  // PartnerPage({Key key, this.title}) : super(key: key);
  
  @override
  _PartnerPageState createState() => _PartnerPageState();
  // _PartnerPageState createState() => _PartnerPageState(title);
}

@override 
class _PartnerPageState extends State<PartnerPage>{
  // _PartnerPageState(title);
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(25.0),
        child: Text(
          'Our Partners Page',
          style: TextStyle(fontSize: 36.0),
        ),
      );
  }

}
