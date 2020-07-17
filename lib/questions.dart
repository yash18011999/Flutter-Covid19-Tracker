//import 'package:flutter/material.dart';
//
//class Question extends StatelessWidget {
//  final String questions;
//  Question(this.questions);
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      width: double.infinity,
//      margin: EdgeInsets.all(10),
//      child: Text(
//        questions,
//        style: TextStyle(fontSize: 25),
//        textAlign: TextAlign.center,
//      ),
//    );
//  }
//}

import 'package:flutter/material.dart';

class Analysis extends StatefulWidget {
  @override
  _AnalysisState createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Self Analysis'),
        ),
      ),
    );
  }
}
