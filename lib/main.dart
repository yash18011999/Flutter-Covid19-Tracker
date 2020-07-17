import 'package:expansiontile/constants.dart';
import 'package:expansiontile/splashscreen.dart';
import 'package:flutter/material.dart';

import 'homepage.dart';

void main() {
  setupLocator();
  runApp(MyApp());}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: "Cairo",
        brightness: Brightness.light,
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
      ),
      debugShowCheckedModeBanner: false,
      home:SplashScreen(),
    );

  }
}
