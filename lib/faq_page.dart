import 'package:flutter/material.dart';

class FaqPage extends StatelessWidget {
  final List<String> questions = <String>[
    'What Is PolyTransfer?',
    'Where are we located?',
    'What does PolyTransfer offer?',
  ];

  final List<String> answers = <String>[
    'PolyTransfer Program is a transfer receptive culture which provides resources and programming to connect and support transfer students to achieve their desired academic, professional, and personal goals.',

    'Student Service Building. Building 121 First Floor.',

    'PolyTransfer offers Peer Mentorship program to help students get connected with different campus resources, and create sense of belonging.',

  ];
  // final List<int> colorCodes = <int>[100];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: questions.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              // height: 150,
              color: Colors.green[100],
              child: Column(                
                children: <Widget>[
                  Text(                    
                    '${questions[index]}',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '${answers[index]}',
                      style: TextStyle(fontSize: 16.0,),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
