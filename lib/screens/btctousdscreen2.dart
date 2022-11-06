import 'package:flutter/material.dart';
import 'package:bitcoin_calculator/main.dart';
import 'package:bitcoin_calculator/utils/calculations.dart';
import 'btctousdscreen1.dart';
import 'package:bitcoin_calculator/config/globals.dart';

class BTCtoUSDScreentwo extends StatefulWidget {
  final double USD;
  final bool enteredValidUSD;
  BTCtoUSDScreentwo(this.enteredValidUSD, this.USD);
  @override
  _BTCtoUSDScreentwoState createState() => _BTCtoUSDScreentwoState();
}

class _BTCtoUSDScreentwoState extends State<BTCtoUSDScreentwo> {
  Future<double> BTCvalue;
  @override
  void initState() {
    super.initState();
    BTCvalue = CalculationAPI.fetchValue(httpClient);
  }

  Widget build(BuildContext context) {
    bool invalidinput = widget.enteredValidUSD;
    double convertedUSD = widget.USD;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding:
                  EdgeInsets.only(top: 200, bottom: 20, left: 100, right: 100),
              child: Text("The conversion from BTC to USD:",
                  key: Key('correct-BTC-text'),
                  style: TextStyle(
                      color: invalidinput ? Colors.white : Colors.green))),
          Container(
            height: 40,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.all(Radius.circular(0))),
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 1),
            child: FutureBuilder<double>(
                future: BTCvalue,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    String convertedDollars = convertedUSD.toStringAsFixed(2);
                    return Text(convertedDollars, key: Key("usd-text"));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                }) /*Text(convertedUSD.toStringAsFixed(2), key: Key('usd-text'))*/,
            alignment: Alignment.center,
          ),
          Padding(
              padding: EdgeInsets.only(right: 250, bottom: 1),
              child: Text(
                "Enter valid BTC",
                key: Key('wrong-BTC-text'),
                style:
                    TextStyle(color: invalidinput ? Colors.red : Colors.white),
              )),
          Container(
              width: 200,
              child: ElevatedButton(
                  key: Key('home-btc-button'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyHomePage()));
                  },
                  child: Text("Home Screen")))
        ])));
  }
}
