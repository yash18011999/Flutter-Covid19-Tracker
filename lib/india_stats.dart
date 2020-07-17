import 'package:flutter/material.dart';

import 'category_card.dart';

class IndiaStats extends StatelessWidget {

  final Map IndiaData;

  const IndiaStats({Key key, this.IndiaData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: 100/80,
        crossAxisSpacing: 15,
        mainAxisSpacing: 20,
        children: <Widget>[
          CategoryCard(
            panelColor: Colors.white,
            title: "CONFIRMED",
            textColor: Colors.black54,
            CounttextColor: Colors.red,
            count: IndiaData['cases'].toString(),
          ),
          CategoryCard(
            panelColor: Colors.white,
            title: "ACTIVE",
            textColor: Colors.black54,
            CounttextColor: Colors.blue,
            count: IndiaData['active'].toString(),
          ),
          CategoryCard(
            panelColor: Colors.white,
            title: "RECOVERED",
            textColor: Colors.black54,
            CounttextColor: Colors.green,
            count: IndiaData['recovered'].toString(),
          ),
          CategoryCard(
            panelColor: Colors.white,
            title: "DEATH",
            textColor: Colors.black54,
            CounttextColor: Colors.black,
            count: IndiaData['deaths'].toString(),
          ),
        ],
      ),
    );
  }
}


