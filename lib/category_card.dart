import 'package:flutter/material.dart';

import 'constants.dart';

class CategoryCard extends StatelessWidget {

  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;
  final Color CounttextColor;

  const CategoryCard({
    Key key, this.panelColor, this.textColor, this.title, this.count, this.CounttextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        decoration: BoxDecoration(
            color: panelColor,
            borderRadius: BorderRadius.circular(13),
            boxShadow: [
              BoxShadow(
                offset: Offset(10,27),
                blurRadius: 20,
                spreadRadius: 23,
                color: Colors.blueGrey,
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: textColor),)),
            SizedBox(height: 20,),
            Text(count,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 36,color: CounttextColor)),
          ],
        ),
      ),
    );
  }
}
