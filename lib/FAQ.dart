import 'package:flutter/material.dart';



class AboutFAQ extends StatelessWidget {
  Function about;
  @override
  AboutFAQ({this.about});
  Widget build(BuildContext context) {
    return Container();
  }
}

class FrequentlyAskedQuestion extends StatelessWidget {
  String ques;
  Function detail;
  @override
  FrequentlyAskedQuestion(this.ques,this.detail);
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => detail()));},
                child: Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Text(
                    ques,
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward_ios),
                  onPressed: null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


