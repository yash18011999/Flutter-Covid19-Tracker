import 'package:flutter/material.dart';

import 'datasource.dart';

class WhatUCanDO extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: Text('What U Can Do')
      ),
      body: Container(
        color: Colors.black.withOpacity(0.001),
        child: ListView.builder(
            padding: EdgeInsets.symmetric(vertical: 10),
            itemCount: Datasource.WhatUCanDo.length,
            itemBuilder: (context,index){
              return Container(
                color: Colors.white,
                margin: const EdgeInsets.all(2),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTile(
                    title: Text(Datasource.WhatUCanDo[index]['heading'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(Datasource.WhatUCanDo[index]['answers'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                      )
                    ],),
                ),
              );
            }),
      ),
    );
  }
}
