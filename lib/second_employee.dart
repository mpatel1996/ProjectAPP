// // Second Employee
//         Container(
//           padding: const EdgeInsets.all(10),
//           child: Container(
//             height: 250,
//             decoration: new BoxDecoration(
//               color: Colors.lightBlueAccent,
//               borderRadius: new BorderRadius.all(Radius.circular(10.0)),
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 children: <Widget>[
//                   RaisedButton(
//                     onPressed: () {
//                       setNames();
//                     },
//                     child: Text(
//                       'Mihir',
//                       style: TextStyle(
//                           fontSize: 24.0, fontWeight: FontWeight.bold),
//                       textAlign: TextAlign.start,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//                   Text(
//                     'Patel',
//                     style: TextStyle(
//                       fontSize: 16.0,
//                     ),
//                   ),
//                   // Image.asset('lib/images/profile_picture.png'),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 20.0),
//                     child: CircleAvatar(
//                       radius: 50.0,
//                       backgroundImage:
//                           AssetImage('lib/images/profile_picture.png'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       ],