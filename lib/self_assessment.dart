import 'package:flutter/material.dart';

void main() => runApp(SelfAssessment());

class SelfAssessment extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return _SelfAssessmentState();
  }
}

class Quiz extends StatelessWidget{
  final List<Map<String, Object>>questions;
  final Function answerQuestion;
  final int questionIndex;
  Quiz({this.questions,this.answerQuestion,this.questionIndex});
  @override
  Widget build(BuildContext context){
    return Column(
        children:[
          Question(
            questions[questionIndex]['questionText'],
          ),
          Container(
            child: Column(
              children: (questions[questionIndex]['answers'] as List<Map<String,Object>>).map((answer) {
                return Answer(()=>answerQuestion(answer['score']),answer['text']);
              }).toList(),
            ),
          ),

        ]
    );
  }
}

class Result extends StatelessWidget{
  final int resultScore;
  final Function resetHandler;
  final result=[
    'Your infection risk is low.',
    'We recommend that you stay at home to avoid any chance of exposure to Novel Corona Virus',
    'Your infection risk is moderate.Please remember to stay quarantined for 14 days after travel. If you experience any coughing, fever, or difficulty breathing in next two weeks, you must schedule your testing by calling toll free helpline 1075.',
    'While you are unwell, your infection risk is low. Do remember that currently it is safer to consult a doctor through phone or video than visit hospital.',
    'You are advised for testing as your infection risk is high. Please call the toll-free helpline 1075 to schedule your testing',

  ];
  @override
  Result(this.resultScore,this.resetHandler);
  String get resultPhrase{
    String resultText;
    if(resultScore<5&&resultScore>=0){
      resultText=result[0];
    }
    else if(resultScore<10&&resultScore>6){
      resultText=result[2];
    }
    else if(resultScore<32&&resultScore>11){
      resultText=result[3];
    }
    else if(resultScore<100&&resultScore>32){
      resultText=result[4];
    }
    return resultText;
  }
  Widget build(BuildContext context){
    return

      Center(
        child:Column(
            children:<Widget>[
              Container(
                margin:EdgeInsets.only(top:50,bottom:10,left: 10),
                child:Text(resultPhrase,style:TextStyle(fontSize:20,color:Colors.black,fontWeight:FontWeight.bold)),
              ),
              Container(
                margin:EdgeInsets.only(top:10,bottom:10,left: 10),
                child:Text(result[1],style:TextStyle(fontSize:17,color:Colors.black,fontWeight:FontWeight.bold)),
              ),
              Container(
                height:70,

                margin:EdgeInsets.only(top:50),
                child:RaisedButton(
                    color:Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),

                    child:Text('Assess Again',style:TextStyle(fontSize:25,fontWeight:FontWeight.bold)),textColor:Colors.white,onPressed:resetHandler
                ),
              ),
            ]
        ),
      );
  }
}

class Question extends StatelessWidget{
  final String questionText;
  Question(this.questionText);
  @override
  Widget build(BuildContext context){
    return Container(



        margin:EdgeInsets.only(top:40,bottom:40),

//               color:Colors.green,
        width:double.infinity,
        alignment:Alignment.center,
        child:Text(questionText,style:TextStyle(color:Colors.black,fontSize:25,),textAlign:TextAlign.center)




    );
  }
}

class Answer extends StatelessWidget{
  final Function selectHandler;
  final String answerText;
  @override
  Answer(this.selectHandler,this.answerText);
  Widget build(BuildContext context){
    return ConstrainedBox(

      constraints: BoxConstraints(
        minHeight: 80,
        maxHeight: 150,
      ),
      child: Container(
        width:250,
//      height: 50,
        margin:EdgeInsets.only(top:20),
        child:RaisedButton(
          child:Container(
            margin:EdgeInsets.only(top:5,bottom:5),
            child:Text(answerText,style:TextStyle(fontSize:20,color:Colors.white,fontWeight:FontWeight.bold)),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color:Colors.teal[900],
          onPressed: selectHandler,
        ),
      ),
    );
  }
}

class _SelfAssessmentState extends State<SelfAssessment>{
  var _questionIndex=0;
  var totalScore=0;

  void resetQuiz(){
    setState((){
      _questionIndex=0;
      totalScore=0;
    });
  }
  void _answerQuestion(int score){
    totalScore+=score;
    setState(() {
      _questionIndex= _questionIndex+1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context){
    var _questions=[
      {
        'questionText':'Are you experiencing any of the following symptoms?',
        'answers':[{'text':'Cough','score':20},
          {'text':'Fever','score':20},
          {'text':'Difficulty in breathing','score':20},
          {'text':'None of Above','score':0},
        ],
      },
      {
        'questionText':'Have you ever had any of the following:',
        'answers':[{'text':'Diabetes','score':2},
          {'text':'Hypertension','score':2},
          {'text':'Lung disease','score':2},
          {'text':'Heart disease','score':2},
          {'text':'None of the Above','score':0},],
      },
      {
        'questionText':'Have you travelled anywhere internationally in last 28-45 days?',
        'answers':[{'text':'Yes','score':7},
          {'text':'No','score':0},
        ],
      },
      {
        'questionText':'Which of the following apply to you:',
        'answers':[{'text':'I have recently interacted with CORONA patient','score':50},
          {'text':'I examined confirmed case of CORONA without protective gear','score':50},
          {'text':'None of the Above','score':0},
        ],
      }
    ];
    return Scaffold(
          appBar:AppBar(
            title:Text('Self Assessment'),
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                      Color.fromRGBO(61, 165, 217, 1),
                      Color.fromRGBO(138, 225, 252, 1)
                    ]),
              ),
            ),
          ),
          body: Container(
//         margin:EdgeInsets.all(10),
//         padding:EdgeInsets.all(10),
            decoration:BoxDecoration(
              color:Colors.white,
              borderRadius:BorderRadius.circular(10),
            ),
            child:Stack(
                children:<Widget>[
                  Container(
                    color:Colors.grey.withOpacity(0.3),
                    height:double.infinity,
                  ),
                  Container(
                    margin:EdgeInsets.only(left: 15,right: 15, top: 15,bottom: 25),
                    padding:EdgeInsets.all(10),
                    decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(10),
                      color:Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey[100],
                            blurRadius: 5,
                            offset: Offset(5, 5),
                        ),
                      ],
                    ),
                    child:ListView(
                        children:<Widget>[


                          Container(
                            margin:EdgeInsets.only(top:5),
                            child:Text('*Please give correct answers. This will help us/you better',style:TextStyle(color:Colors.red,fontWeight:FontWeight.bold)),
                          ),

                          Container(
                            margin:EdgeInsets.only(top:5),
                            decoration:BoxDecoration(
                              borderRadius:BorderRadius.circular(10),
                            ),
                            child:_questionIndex<_questions.length ?
                            Quiz(answerQuestion:_answerQuestion,
                              questionIndex:_questionIndex,
                              questions:_questions,
                            )
                                : Result(totalScore,resetQuiz),

                          ),
//             RaisedButton(
//               child:Text('NEXT'),
//               onPressed:_answerQuestion(answer['score']),
//             ),
                        ]
                    ),
                  ),
                ]
            ),


          ),


          floatingActionButton:Container(
//            height:100,
              width: double.infinity,
              margin: EdgeInsets.only(left:30,bottom:30),
              child:Transform.scale(scale: 1.0,
                child: FloatingActionButton(

                  backgroundColor:Colors.green,
                  child:Icon(Icons.refresh,size: 40,color: Colors.white,),
                  onPressed: resetQuiz,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//                floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                ),
              )
//              floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat
          )

      );
  }
}
