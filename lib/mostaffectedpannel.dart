import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MostaffectedPanel extends StatelessWidget {
  final List countryData;

  const MostaffectedPanel({Key key, this.countryData}) : super(key: key);
  @override
  Widget build(BuildContext context) {
         return Container(
        height: 200,
             decoration: BoxDecoration(
                 //color: Colors.red,
                 borderRadius: BorderRadius.only(
                     bottomRight: Radius.circular(20),
                     bottomLeft: Radius.circular(20),
                     topRight: Radius.circular(20),
                     topLeft: Radius.circular(20)),
                 boxShadow: [
                                                BoxShadow(
                                                    color: Colors.blueGrey.withOpacity(0.20),
                                                    blurRadius: 10,
                                                    spreadRadius: 1,
                                                    offset: Offset(0, 10))
                 ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemBuilder: (context,index){

                  return Container(
                    //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                    //color: Colors.green,
                    //height: 310,
                    //width: 200,
                    margin:
                    EdgeInsets.symmetric(horizontal: 2, vertical: 3),
                    child: Container(
                      //margin: EdgeInsets.only(left:0),
                      padding: EdgeInsets.symmetric(
                          vertical: 0.0, horizontal: 0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20)),
                            boxShadow: [
//                                                BoxShadow(
//                                                    color: Colors.black.withOpacity(0.20),
//                                                    blurRadius: 10,
//                                                    spreadRadius: 1,
//                                                    offset: Offset(0, 4))
                            ]),
                        child: Container(
//                          color: Colors.green,
                          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  //height: 50,
//                                 color: Colors.red,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                          flex: 1,
                                          child: Container(
                                            //color: Colors.pink,
                                            child: Image.network(
                                              countryData[index]
                                              ['countryInfo']['flag'],
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
                                            //color: Colors.black,
                                            child: Column(
                                              mainAxisAlignment:
                                              MainAxisAlignment.start,
                                              crossAxisAlignment:
                                              CrossAxisAlignment
                                                  .start,
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 3,
                                                  child: Container(
                                                    //color: Colors.red,
                                                    child: Container(
                                                      // color: Colors.red,
                                                      child: Text(
                                                        countryData[index]
                                                        ['country'],
                                                        style: TextStyle(
                                                          fontWeight:
                                                          FontWeight
                                                              .bold,
                                                          fontSize: 23,
                                                        ),
                                                        textAlign:
                                                        TextAlign
                                                            .center,
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
                                                        textAlign:
                                                        TextAlign
                                                            .center,
                                                      ),
                                                    )),
                                                Expanded(
                                                    flex: 2,
                                                    child: Container(
                                                      //color: Colors.green,
                                                      child: Text(
                                                        countryData[index]
                                                        ['cases']
                                                            .toString(),
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                          FontWeight
                                                              .w500,
                                                        ),
                                                        textAlign:
                                                        TextAlign
                                                            .center,
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
                                height: 5,
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  //color: Colors.green,
                                  margin: EdgeInsets.only(left:0, top:0, right:30, bottom:0),
                                  //height: 140,
                                  child: Row(
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                         // color: Colors.red,
                                          child: Container(
                                           // margin: EdgeInsets.all(0),
                                            child: Row(
                                              children: <Widget>[
                                                Expanded(
                                                  flex: 2,
                                                  child: Container(
                                                    //color: Colors.yellowAccent,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .start,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: <Widget>[
                                                        Text(
                                                            'Today Cases'),
                                                        Text(
                                                            'Today Deaths'),
                                                        Text(
                                                            'Active Cases'),
                                                        Text(
                                                            'Fatal Cases'),
                                                        Text(
                                                            'Recoverd Cases'),
                                                        Text(
                                                            'CasesPerOneMillion'),
                                                      ],
                                                    ),
                                                  ),
                                                ),

                                                Expanded(
                                                  flex: 1,
                                                  child: Container(
                                                    //color: Colors.cyan,
                                                    child: Column(
                                                      //mainAxisAlignment: MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .end,
                                                      children: <Widget>[
                                                        Text(countryData[
                                                        index]
                                                        [
                                                        'todayCases']
                                                            .toString()),
                                                        Text(countryData[
                                                        index]
                                                        [
                                                        'todayDeaths']
                                                            .toString()),
                                                        Text(countryData[
                                                        index]
                                                        ['active']
                                                            .toString()),
                                                        Text(countryData[
                                                        index]
                                                        [
                                                        'critical']
                                                            .toString()),
                                                        Text(countryData[
                                                        index]
                                                        [
                                                        'recovered']
                                                            .toString()),
                                                        Text(countryData[
                                                        index]
                                                        [
                                                        'casesPerOneMillion']
                                                            .toString()),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),

                  );
                },
                itemCount: 5,
                //controller: controller,



              ),
            ),
          ],
        )
//          Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisAlignment: MainAxisAlignment.center,
//            children: <Widget>[
//            Container(
//              height: 200, // card height
//              child: PageView.builder(
//                itemCount: 10,
//                controller: PageController(viewportFraction: 0.7),
//                onPageChanged: (int index) => setState(() => _index = index),
//                itemBuilder: (_, i) {
//                return Transform.scale(
//                  scale: i == _index ? 1 : 0.9,
//                  child: Card(
//                    elevation: 6,
//                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//                    child: Center(
//                      child: Text(
//                        "Card ${i + 1}",
//                        style: TextStyle(fontSize: 32),
//                      ),
//                    ),
//                  ),
//                );
//              },
//            ),
//             ),
//            ],
//          ),
    );

 //old contaier
//      Container(
//      height: 200,
//      //color: Colors.green,
////      child: ListView.builder(
////        scrollDirection: Axis.horizontal,
////        controller: PageController(viewportFraction: 1.0),
////        itemBuilder: (context,index){
////          return Container(
////              width: MediaQuery.of(context).size.width * 0.90,
////            margin: EdgeInsets.all(0),
////            child: Card(
////             // color: Colors.blue,
////               shape: RoundedRectangleBorder(
////                borderRadius: BorderRadius.circular(20.0),),
////              child: Container(
////                decoration: BoxDecoration(
////                  color: Colors.white,
////                                  borderRadius: BorderRadius.only(
////                                      bottomRight: Radius.circular(20),
////                                      bottomLeft: Radius.circular(20),
////                                      topRight: Radius.circular(20),
////                                      topLeft: Radius.circular(20)),
////                ),
////                child: Center(child: Text(countryData[index]['cases'].toString(), style: TextStyle(color: Colors.black, fontSize: 36.0),)),
////              ),
////            ),
////          );
////      },
////      itemCount: 5,),
//      child: ListView.builder(
//        scrollDirection: Axis.horizontal,
//        itemBuilder: (context, index) {
//          return Container(
//            height: 200,
//            //color: Colors.red,
//            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
//            decoration: BoxDecoration(
//              color: Colors.white,
//              boxShadow: [
//                BoxShadow(
//                    color: Colors.grey, blurRadius: 20, offset: Offset(0, 3)),
//              ],
//              borderRadius: BorderRadius.only(
//                  bottomRight: Radius.circular(20),
//                  bottomLeft: Radius.circular(20),
//                  topRight: Radius.circular(20),
//                  topLeft: Radius.circular(20)),
//            ),
//            child: Container(
//              //color: Colors.green,
//              margin: EdgeInsets.all(15),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.start,
//                crossAxisAlignment: CrossAxisAlignment.start,
//                children: <Widget>[
//                  Expanded(
//                    flex: 1,
//                    child: Container(
//                      height: 50,
//                      //color: Colors.red,
//                      child: Row(
//                        children: <Widget>[
//                          Expanded(
//                              flex: 1,
//                              child: Container(
//                                //color: Colors.pink,
//                                child: Image.network(
//                                  countryData[index]['countryInfo']['flag'],
//                                  fit: BoxFit.fitHeight,
//                                ),
//                                height: double.infinity,
//                              )),
//                          SizedBox(
//                            width: 10,
//                          ),
//                          Expanded(
//                              flex: 3,
//                              child: Container(
//                                //color: Colors.blue,
//                                child: Column(
//                                  mainAxisAlignment: MainAxisAlignment.start,
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  children: <Widget>[
//                                    Expanded(
//                                      flex: 2,
//                                      child: Container(
//                                        //color: Colors.red,
//                                        child: Container(
//                                          // color: Colors.red,
//                                          child: Text(
//                                            countryData[index]['country'],
//                                            style: TextStyle(
//                                              fontWeight: FontWeight.bold,
//                                              fontSize: 23,
//                                            ),
//                                            textAlign: TextAlign.center,
//                                          ),
//                                        ),
//                                      ),
//                                    ),
//                                    Expanded(
//                                        flex: 1,
//                                        child: Container(
//                                          //color: Colors.yellowAccent,
//                                          child: Text(
//                                            'Total Cases',
//                                            style: TextStyle(
//                                              fontSize: 15,
//                                            ),
//                                            textAlign: TextAlign.center,
//                                          ),
//                                        )),
//                                    Expanded(
//                                        flex: 1,
//                                        child: Container(
//                                          //color: Colors.green,
//                                          child: Text(
//                                            countryData[index]['cases']
//                                                .toString(),
//                                            style: TextStyle(
//                                              fontSize: 15,
//                                              fontWeight: FontWeight.w500,
//                                            ),
//                                            textAlign: TextAlign.center,
//                                          ),
//                                        )),
//                                  ],
//                                ),
//                              ))
//                        ],
//                      ),
//                    ),
//                  ),
//                  SizedBox(
//                    height: 10,
//                  ),
//                  Expanded(
//                    flex: 2,
//                    child: Container(
//                      //color: Colors.green,
//                      height: 130,
//                      child: Row(
//                        children: <Widget>[
//                          Expanded(
//                            flex: 1,
//                            child: Container(
//                              //color: Colors.red,
//                              child: Container(
//                                margin: EdgeInsets.all(2),
//                                child: Row(
//                                  children: <Widget>[
//                                    Expanded(
//                                      flex: 2,
//                                      child: Container(
//                                        //color: Colors.yellowAccent,
//                                        child: Column(
//                                          mainAxisAlignment:
//                                              MainAxisAlignment.start,
//                                          crossAxisAlignment:
//                                              CrossAxisAlignment.start,
//                                          children: <Widget>[
//                                            Text('Today Cases'),
//                                            Text('Today Deaths'),
//                                            Text('Active Cases'),
//                                            Text('Fatal Cases'),
//                                            Text('Recoverd Cases'),
//                                            Text('CasesPerOneMillion'),
//                                          ],
//                                        ),
//                                      ),
//                                    ),
//                                    Expanded(
//                                      flex: 1,
//                                      child: Container(
//                                        //color: Colors.cyan,
//                                        child: Column(
//                                          //mainAxisAlignment: MainAxisAlignment.end,
//                                          crossAxisAlignment:
//                                              CrossAxisAlignment.end,
//                                          children: <Widget>[
//                                            Text(countryData[index]
//                                                    ['todayCases']
//                                                .toString()),
//                                            Text(countryData[index]
//                                                    ['todayDeaths']
//                                                .toString()),
//                                            Text(countryData[index]['active']
//                                                .toString()),
//                                            Text(countryData[index]['critical']
//                                                .toString()),
//                                            Text(countryData[index]['recovered']
//                                                .toString()),
//                                            Text(countryData[index]
//                                                    ['casesPerOneMillion']
//                                                .toString()),
//                                          ],
//                                        ),
//                                      ),
//                                    ),
//                                  ],
//                                ),
//                              ),
//                            ),
//                          ),
//                          Expanded(
//                            flex: 1,
//                            child: Container(
//                                //color: Colors.blue,
//                                ),
//                          )
//                        ],
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            ),
//          );
//        },
//        itemCount: 5,
//      ),
//    );////
  }
}
