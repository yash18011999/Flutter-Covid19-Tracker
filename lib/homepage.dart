import 'dart:convert';
import 'package:expansiontile/donate.dart';
import 'package:expansiontile/healthtip.dart';
import 'package:expansiontile/constants.dart';
import 'package:expansiontile/countrypage.dart';
import 'package:expansiontile/newscorona.dart';
import 'package:expansiontile/self_assessment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'india_stats.dart';
import 'mostaffectedpannel.dart';
import 'package:get_it/get_it.dart';

class callService{
  void call(String number) => launch("tel://$number");
}

GetIt locator = GetIt();

void setupLocator() {
  locator.registerSingleton(callService());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Map IndiaData;
  fetchWorldwideData() async {
    http.Response response = await http.get("https://corona.lmao.ninja/v2/all");
    setState(() {
      IndiaData = jsonDecode(response.body);
    });
  }

  List countryData;
  fetchcountryData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchWorldwideData();
    fetchcountryData();
    super.initState();
  }

  final String number1 = '12345678901';
  final String number2 = '12345678901';
  final callService _service = locator<callService>();

  void showBootomSheet() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 250,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Text(
                        'Emergency Numbers',
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Container(
                        //color: Colors.green,
                        child: Padding(
                          padding: EdgeInsets.all(0),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Icon(Icons.call,color: Colors.green,),
                                title: Text(
                                  '1234567',
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text('State HelpLine Number',style: TextStyle(color: Colors.blueGrey),),
                                trailing: RaisedButton(
                                  onPressed: (){_service.call(number1);},
                                  color: Colors.green,
                                  child: Text('Call'),
                                  textColor: Colors.white,
                                ),
                              ),
                              ListTile(
                                leading: Icon(Icons.call,color: Colors.green,),
                                title: Text(
                                  '1234567',
                                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text('Central HelpLine Number',style: TextStyle(color: Colors.blueGrey),),
                                trailing: RaisedButton(
                                  onPressed: (){_service.call(number2);},
                                  color: Colors.green,
                                  child: Text('Call'),
                                  textColor: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          );
        });

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final controller = PageController(viewportFraction: 1);

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
              Press: () {},
              isActive: true,
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
              Press: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HealthTips()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              height: size.height * .40,
              decoration: BoxDecoration(
                  //color: Color(0xFFF5CEB8),
                  gradient: new LinearGradient(
                    colors: [
                      Color.fromRGBO(61, 165, 217, 1),
                      Color.fromRGBO(138, 225, 252, 1)
                    ],
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'COVID-19 TRACKER',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        ),
                        Icon(Icons.share),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 35),
                    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 5),
                    height: 50,
                    decoration: BoxDecoration(
                        //color: Colors.white,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Donate()));
                            },
                            shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(color: Colors.white, width: 0.5),
                                borderRadius: BorderRadius.circular(80.0)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [Colors.red, Colors.red[200]],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 170.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Donate",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50.0,
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SelfAssessment()));
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(80.0),
                                side: BorderSide(
                                    color: Colors.white, width: 0.5)),
                            padding: EdgeInsets.all(0.0),
                            child: Ink(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.blueAccent,
                                      Color(0xff64B6FF)
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 170.0, minHeight: 50.0),
                                alignment: Alignment.center,
                                child: Text(
                                  "Self Assessment",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: countryData == null
                        ? Container(
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          )
                        : IndiaStats(
                            IndiaData: IndiaData,
                          ),
                  ),
                  Padding(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Most Affected Countries',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CountryPage()));
                              },
                              child: Text(
                                'View All',
                                style: TextStyle(
                                  color: Colors.blue,
                                ),
                              ))
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(vertical: 30, horizontal: 10)),
                  countryData == null
                      ? Container(
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        )
                      : MostaffectedPanel(
                          countryData: countryData,
                        ),
                ],
              ),
            )
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
