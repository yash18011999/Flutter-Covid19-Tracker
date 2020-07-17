import 'dart:convert';
import 'package:expansiontile/search.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CountryPage extends StatefulWidget {
  @override
  _CountryPageState createState() => _CountryPageState();
}

class _CountryPageState extends State<CountryPage> {
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
    fetchcountryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Country Statistics'),
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
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: (){
            showSearch(context: context, delegate: Search(countryData)) ;
          })
        ],
      ),
      body: countryData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemBuilder: (context, index) {
                return Container(
                  height: 400,
                  //color: Colors.red,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.blueGrey[100],
                          blurRadius: 5,
                          offset: Offset(5, 5)),
                    ],
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20)),
                  ),
                  child: Container(
//                    color: Colors.green,
                    margin: EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 50,
//                            color: Colors.red,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                    flex: 1,
                                    child: Container(
                                      //color: Colors.pink,
                                      child: Image.network(
                                        countryData[index]['countryInfo']
                                            ['flag'],
                                        fit: BoxFit.fitHeight,
                                      ),
                                      height: double.infinity,
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Container(
                                      //color: Colors.blue,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              //color: Colors.red,
                                              child: Container(
//                                                 color: Colors.red,
                                                child: Text(
                                                  countryData[index]['country'],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 2,
                                              child: Container(
                                                //color: Colors.yellowAccent,
                                                child: Text(
                                                  'Total Cases',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                          Expanded(
                                              flex: 2,
                                              child: Container(
                                                //color: Colors.green,
                                                child: Text(
                                                  countryData[index]['cases']
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
//                            color: Colors.green,
                            margin: EdgeInsets.only(left:0, top:0, right:30, bottom:0),
                            height: 130,
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    //color: Colors.red,
                                    child: Container(
                                      margin: EdgeInsets.all(2),
                                      child: Row(
                                        children: <Widget>[
                                          Expanded(
                                            flex: 2,
                                            child: Container(//color: Colors.yellowAccent,
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Text('Today Cases'),
                                                Text('Today Deaths'),
                                                Text('Active Cases'),
                                                Text('Fatal Cases'),
                                                Text('Recoverd Cases'),
                                                Text('CasesPerOneMillion'),
                                              ],
                                            ),),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(//color: Colors.cyan,
                                              child: Column(
                                                //mainAxisAlignment: MainAxisAlignment.end,
                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(countryData[index]['todayCases'].toString()),
                                                  Text(countryData[index]['todayDeaths'].toString()),
                                                  Text(countryData[index]['active'].toString()),
                                                  Text(countryData[index]['critical'].toString()),
                                                  Text(countryData[index]['recovered'].toString()),
                                                  Text(countryData[index]['casesPerOneMillion'].toString()),
                                                ],
                                              ),),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

//                                Expanded(
//                                  flex: 1,
//                                  child: Container(
//                                    child: PieChart(dataMap: {
//                                      'Confirmed':countryData[index]['cases'].toDouble(),
//                                      'Active':countryData[index]['active'].toDouble(),
//                                      'Recoverd':countryData[index]['recovered'].toDouble(),
//                                      'Death':countryData[index]['deaths'].toDouble(),
//                                    }),
//                                  ),
//                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 8,
                          child: Container(//color: Colors.yellowAccent,
                                    child: PieChart(dataMap: {
                                      'Confirmed':countryData[index]['cases'].toDouble(),
                                      'Active':countryData[index]['active'].toDouble(),
                                      'Recoverd':countryData[index]['recovered'].toDouble(),
                                      'Death':countryData[index]['deaths'].toDouble(),
                                    }),
                        )),
                      ],
                    ),
                  ),
                );
              },
              itemCount: countryData == null ? 0 : countryData.length,
            ),
    );
  }
}
