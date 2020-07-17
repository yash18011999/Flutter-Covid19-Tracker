import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Search extends SearchDelegate {
  final List countryList;

  Search(this.countryList);
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? countryList
        : countryList
            .where((element) =>
                element['country'].toString().toLowerCase().startsWith(query))
            .toList();
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context,index){
               return Container(
                height: 400,
                //color: Colors.red,
                margin:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20,
                        offset: Offset(0, 3)),
                  ],
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                ),
                child: Container(
                  //color: Colors.green,
                  margin: EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 50,
                          //color: Colors.red,
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    //color: Colors.pink,
                                    child: Image.network(
                                      suggestionList[index]['countryInfo']
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
                                          flex: 2,
                                          child: Container(
                                            //color: Colors.red,
                                            child: Container(
                                              // color: Colors.red,
                                              child: Text(
                                                suggestionList[index]['country'],
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 23,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                            flex: 1,
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
                                            flex: 1,
                                            child: Container(
                                              //color: Colors.green,
                                              child: Text(
                                                suggestionList[index]['cases']
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 15,
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
                        flex: 2,
                        child: Container(
                          // color: Colors.green,
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
                                                Text(suggestionList[index]['todayCases'].toString()),
                                                Text(suggestionList[index]['todayDeaths'].toString()),
                                                Text(suggestionList[index]['active'].toString()),
                                                Text(suggestionList[index]['critical'].toString()),
                                                Text(suggestionList[index]['recovered'].toString()),
                                                Text(suggestionList[index]['casesPerOneMillion'].toString()),
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
                          flex: 4,
                          child: Container(//color: Colors.yellowAccent,
                            child: PieChart(dataMap: {
                              'Confirmed':suggestionList[index]['cases'].toDouble(),
                              'Active':suggestionList[index]['active'].toDouble(),
                              'Recoverd':suggestionList[index]['recovered'].toDouble(),
                              'Death':suggestionList[index]['deaths'].toDouble(),
                            }),
                          )),
                    ],
                  ),
                ),
              );
    });
  }
}
