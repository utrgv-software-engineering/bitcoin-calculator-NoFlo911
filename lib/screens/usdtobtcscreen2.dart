import 'package:flutter/material.dart';
import 'package:bitcoin_calculator/main.dart';
import 'package:bitcoin_calculator/utils/calculations.dart';
import 'usdtobtcscreen1.dart';

class USDtoBTCScreentwo extends StatefulWidget {
  final double BTC;
  final bool enteredValidUSD;
  USDtoBTCScreentwo(this.enteredValidUSD, this.BTC);
  @override
  _USDtoBTCScreentwoState createState() => _USDtoBTCScreentwoState();
}

class _USDtoBTCScreentwoState extends State<USDtoBTCScreentwo> {
  @override
  Widget build(BuildContext context) {
    bool invalidinput = widget.enteredValidUSD;
    double convertedBitcoin = widget.BTC;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding:
                  EdgeInsets.only(top: 200, bottom: 20, left: 100, right: 100),
              child: Text("The conversion from USD to BTC:",
                  key: Key('correct-USD-text'),
                  style: TextStyle(
                      color: invalidinput ? Colors.white : Colors.green))),
          Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(0))),
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 1),
            child:
                Text(convertedBitcoin.toStringAsFixed(6), key: Key('btc-text')),
            alignment: Alignment.center,
          ),
          Padding(
              padding: EdgeInsets.only(right: 250, bottom: 1),
              child: Text(
                "Enter valid USD",
                key: Key('wrong-USD-text'),
                style:
                    TextStyle(color: invalidinput ? Colors.red : Colors.white),
              )),
          Container(
              width: 200,
              child: ElevatedButton(
                  key: Key('home-usd-button'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Text("Home Screen")))
        ])));
  }
}
