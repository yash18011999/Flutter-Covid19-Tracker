import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';


class Donate extends StatefulWidget {
  @override
  _DonateState createState() => _DonateState();
}

class _DonateState extends State<Donate> {

  Razorpay razorpay;
  TextEditingController textEditingController = new TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    razorpay.clear();
  }

  void openCheckOut(){
    var options = {
      'key':'rzp_test_xPmzXU9jL3a8Zg',
      'amount':num.parse(textEditingController.text)*100,
      'name':'sample app',
      'description':'Payment for the PM Cares',
      'prefill':{
        'contact':"8107327805",
        //'email':'chouhanyashvardhan89@gmail.com',
      },
      'external':{
        'wallets':['paytm']
      }

    };

    try{
      razorpay.open(options);
    }catch(e){
      print(e.toString());
    }


  }
  void handlerPaymentSuccess(){
    print('Payment Success');
    Toast.show('Payment Success', context);
  }

  void handlerPaymentError(){
    print('Payment Error');
    Toast.show('Payment Error', context);
  }

  void handlerExternalWallet(){
    print('External Wallet');
    Toast.show('External Wallet', context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Donate for COVID'),
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

      ),
      body: Center(
        child:Column(
          children: <Widget>[
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(labelText: 'Enter Amount here'),),
            SizedBox(height: 30,),
            RaisedButton(onPressed: (){openCheckOut();},child: Text('Donate'),),
          ],
        ),
      ),
    );
  }
}
