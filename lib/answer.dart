import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final Function selection;
  final String answer;
  const Answers({Key key, this.selection, this.answer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child:  RaisedButton(
          child: Text(answer),
          textColor: Colors.white,
          color: Colors.blue,
          onPressed: selection),
    );
  }
}
