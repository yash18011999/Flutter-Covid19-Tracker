import 'package:expansiontile/CovidTesting.dart';
import 'package:expansiontile/FAQ.dart';
import 'package:expansiontile/WhatUCanDo.dart';
import 'package:expansiontile/aboutcovid.dart';
import 'package:expansiontile/prevention.dart';
import 'package:expansiontile/self_assessment.dart';
import 'package:expansiontile/symptoms.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'countrypage.dart';
import 'homepage.dart';
import 'newscorona.dart';

class HealthTips extends StatefulWidget {
  @override
  _HealthTipsState createState() => _HealthTipsState();
}

class Cards extends StatelessWidget {
  String title;
  String image;
  Function function;

  @override
  Cards({this.image, this.title,this.function});
  Widget build(BuildContext context) {
    return Container();
  }
}

class FAQ extends StatelessWidget {
  String text;
  @override
  FAQ(this.text);
  Widget build(BuildContext context) {
    return Container();
  }
}

class Grid extends StatelessWidget {
  String imageUrl;
  @override
  Grid(this.imageUrl);
  Widget build(BuildContext context) {
    return Container();
  }
}

class _HealthTipsState extends State<HealthTips> {
  final List<Grid> url = [
    Grid('images/advice1.jpg'),
    Grid('images/advice2.jpg'),
    Grid('images/advice3.jpg'),
    Grid('images/advice4.jpg'),
  ];
  final List<FAQ> questions = [
    FAQ(
      'About COVID-19',
    ),
    FAQ(
      'What you can do?',
    ),
    FAQ(
      'COVID-19 Testing',
    ),
    FAQ(
      'Support Yourself',
    ),
  ];
  final List<Cards> card = [
    Cards(
      image: 'images/sym.jpg',
      title: 'Symptoms',
      function: () => Symptoms(),
    ),
    Cards(
      image: 'images/pre.jfif',
      title: 'Prevention',
      function: () => Prevention(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 0),
                  blurRadius: 17,
                  spreadRadius: 5,
                  color: Colors.blue[50],
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              BottomNavItems(
                title: "Home",
                iconImg: Icons.home,
                Press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
              ),
              BottomNavItems(
                title: "Data Stats",
                iconImg: Icons.pie_chart,
                Press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CountryPage()));
                },
              ),
              BottomNavItems(
                title: "News",
                iconImg: Icons.update,
                Press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CoronaNews()));
                },
              ),
              BottomNavItems(
                title: "Health Tips",
                iconImg: Icons.help,
                isActive: true,
                Press: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HealthTips()));
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
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
          title: Text(
            'Health Tips',
          ),

        ),
        body: Container(
          color: Colors.black12,
          child: ListView(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        width: double.infinity,
                        child: Text(
                          'COVID-19 Self Assessment',
                          style: TextStyle(
                              fontSize: 21, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                padding: EdgeInsets.only(
                                  left: 10,
                                  right: 40,
                                ),
                                child: Text(
                                    'Please give correct answers. Accurate answers help us better. Medical and support staff are valuable and very limited. Be a responsible citizen.'),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: Image.asset(
                                  'images/assessment.png',
                                  fit: BoxFit.cover,
                                ),
                                height: 130,
                                width: 130,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10),
                        child: InkWell(
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Access Yourself',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.green,
                            ),
                          ),
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SelfAssessment()));
                          },
                        ),
//                      child: RaisedButton(
//                        onPressed: null,
//                        child: Container(
//                          padding:EdgeInsets.all(5),
//                          color: Colors.greenAccent,
//                          child: Text('Access Yourself',style: TextStyle(fontSize: 20,color: Colors.white, fontWeight: FontWeight.bold),),
//                        ),
//
//
//                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  children: card.map((half) {
                    return Expanded(
                      flex: 1,
                      child: Container(
//                      padding: EdgeInsets.only(left: 10),
                        child: Column(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => half.function()));
                              },
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        margin: EdgeInsets.all(10),
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(half.image),
                                          radius: 25,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        half.title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: Column(
                    children: <Widget>[
                      FrequentlyAskedQuestion('About COVID-19', ()=>AboutCovid()),
                      FrequentlyAskedQuestion('What you can do?', ()=>WhatUCanDO()),
                      FrequentlyAskedQuestion('COVID-19 Testing', ()=>CovidTesting()),
                    ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Advice by WHO',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  child: Text(
                                    'Learn More',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                    textAlign: TextAlign.end,
                                  ),
                                  onTap: () {
                                    print('successful');
                                  },
//                              onTap: () => launch('https://www.who.int/emergencies/diseases/novel-coronavirus-2019/advice-for-public'),
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(20),
                        child: GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            crossAxisSpacing: 20,
                            mainAxisSpacing: 20,
                            children: url.map((grid) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: AssetImage(grid.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.blue,
                                ),
                              );
                            }).toList()),
                      ),
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

class BottomNavItems extends StatelessWidget {
  final IconData iconImg;
  final String title;
  final Function Press;
  final bool isActive;
  const BottomNavItems({
    Key key,
    this.iconImg,
    this.title,
    this.Press,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            iconImg,
            color: isActive ? kActiveIconColor : kTextColor,
            size: 30,
          ),

          // SvgPicture.asset("assets.svgimages/bookicon.svg",color: Colors.black,),
          Text(
            title,
            style: TextStyle(
                color: isActive ? kActiveIconColor : kTextColor, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
