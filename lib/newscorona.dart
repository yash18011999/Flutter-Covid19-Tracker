import 'package:flutter/material.dart';

import 'article_model.dart';
import 'article_view.dart';
import 'constants.dart';
import 'countrypage.dart';
import 'healthtip.dart';
import 'homepage.dart';
import 'news.dart';

class CoronaNews extends StatefulWidget {
  @override
  _CoronaNewsState createState() => _CoronaNewsState();
}

class _CoronaNewsState extends State<CoronaNews> {

  List<ArticleModel> articles = new List<ArticleModel>();
  bool _loading = true;

  void initState(){
    super.initState();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                Press: () {

                },

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
                isActive: true,
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
        appBar: AppBar(
          // backgroundColor: Colors.white,
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
        body: _loading
            ? Center(
            child: Container(
              child: CircularProgressIndicator(),
            ))
            : Container(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (context,index){
                  return BlogTile(
                    title: articles[index].title,
                    desc: articles[index].published,
                    published: articles[index].url,
                  );
                })));
  }
}

class BlogTile extends StatelessWidget {
  final String published;
  final String title;
  final String desc;

  const BlogTile(
      {@required this.published, @required this.title, @required this.desc});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ArticleView(
          blogurl: published,
        )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
        child: Card(
          elevation: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,style: TextStyle(fontWeight:FontWeight.bold,fontSize: 25),),
              SizedBox(height: 8,),
              Text(published,style: TextStyle(color: Colors.blue),),
              SizedBox(height: 8,),
              Text(desc,textAlign: TextAlign.end,),

            ],
          ),
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
