import 'package:expansiontile/healthtip.dart';
import 'package:flutter/material.dart';

import 'constants.dart';
import 'countrypage.dart';
import 'homepage.dart';
import 'newscorona.dart';

void main() {
  runApp(Prevention());
}

class Prevention extends StatefulWidget {
  @override
  _PreventionState createState() => _PreventionState();
}

class About extends StatelessWidget {
  String img;
  String title;
  String text;
  @override
  About({this.title,this.text,this.img});
  Widget build(BuildContext context) {
    return Container();
  }
}


class _PreventionState extends State<Prevention> {
  final List<About> measures= [
    About(
      title: 'Wash your hands often',
      text: 'Clean your hands often. Use soap and water, or an alcohol-based hand rub.',
      img: 'images/washHands.jpg',
    ),
    About(
      title: 'Wear a face mask',
      text: 'Cover your face with a mask and avoid touching it often.',
      img: 'images/mask.jpg',
    ),
    About(
      title: 'Avoid contact with sick people',
      text: 'Maintain a safe distance from anyone who is coughing or sneezing.',
      img: 'images/sick.jpg',
    ),
    About(
      title: 'Always cover your cough or sneeze',
      text: 'Cover your nose and mouth with your bent elbow or a tissue when you cough or sneeze.',
      img: 'images/mouthCover.jpg',
    ),
    About(
      title: 'Stay home Stay safe',
      text: 'Stay home if you feel unwell.',
      img: 'images/stayHome.jpg',
    ),


  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
            'Preventive Measures',
          ),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black12,
          child: Container(
            margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child:ListView(
              children: measures.map((mea){
                return Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(10),
                      height: 115,
//                  color: Colors.green,
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(45),
                              ),

                              child: Container(

                                  decoration: BoxDecoration(
//                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  margin: EdgeInsets.all(5),
                                  child: CircleAvatar(
                                    radius:35,
                                    backgroundImage: AssetImage(mea.img),)
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                SizedBox(
                                  height: 7,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      alignment: Alignment.centerLeft,
//                                      color: Colors.red,
                                      child: Text(mea.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(mea.text),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 2,
                      color: Colors.grey.withOpacity(0.2),
                    ),
                  ],
                );
              }).toList(),
            ),

          ),
        ),
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
