import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resethandler;
  const Result( this.resultScore, this.resethandler) ;

  String get resultPhrase {
    String resultText = 'You Did It!';
    if(resultScore<=8){
      resultText = 'Good';
    }
    else if(resultScore<=12){
      resultText = 'Great';
    }
    else if(resultScore<=18){
      resultText = 'Excellent';
    }
    else{
      resultText = 'Bad';
    }
    return resultText;
  }

  @override

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Text(resultPhrase,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
        ),
        FlatButton(onPressed: resethandler, child: Text('Reset Quiz',style: TextStyle(color: Colors.blue),))
      ],
    );
  }
}
