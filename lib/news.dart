import 'dart:convert';

//import 'package:covidnews/article_model.dart';
import 'package:http/http.dart' as http;

import 'article_model.dart';
class News{
  List<ArticleModel> news = [];


  Future<void> getNews() async{

    String url = 'https://covid19-us-api.herokuapp.com/news';

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['success']== true){
      jsonData['message'].forEach((element){

        if(element['published']!=null){
          ArticleModel articleModel = ArticleModel(
            title: element['title'],
            published: element['published'],
            url: element['url'],
          );

          news.add(articleModel);
        }

      });
    }
  }
}