import 'package:flutter/material.dart';
import 'btctousdscreen1.dart';
import 'usdtobtcscreen1.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: <
                    Widget>[
      Container(
        margin: EdgeInsets.only(bottom: 10),
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => USDtoBTCScreenone()));
            },
            key: Key('usd-to-btc-button'),
            style: ElevatedButton.styleFrom(primary: Colors.grey),
            child: Container(
                alignment: Alignment.center,
                child:
                    Text("USD to BTC", style: TextStyle(color: Colors.black)))),
      ),
      ElevatedButton(
          onPressed: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => BTCtoUSDScreenone()));
          },
          key: Key('btc-to-usd-button'),
          style: ElevatedButton.styleFrom(primary: Colors.grey),
          child: Container(
              alignment: Alignment.center,
              child:
                  Text("BTC to USD", style: TextStyle(color: Colors.black)))),
    ])));
  }
}
