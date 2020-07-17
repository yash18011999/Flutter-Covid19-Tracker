import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';


class ArticleView extends StatefulWidget {

  String blogurl;
  ArticleView({this.blogurl});
  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.white,
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
          title: Row(
            children: <Widget>[
              Text(
                'Flutter',
                style: TextStyle(color: Colors.white),
              ),
              Text(
                'News',
                style: TextStyle(color: Colors.white),
              ),
            ],
          )),
      body:
      Container(
        child: WebView(
          initialUrl: widget.blogurl,
          onWebViewCreated: ((WebViewController webViewController){
            _completer.complete(webViewController);
          }),
        ),
      ) ,
    );
  }
}
