import 'package:flutter/material.dart';
import 'package:bitcoin_calculator/main.dart';
import 'package:bitcoin_calculator/utils/calculations.dart';
import 'usdtobtcscreen2.dart';
import 'package:bitcoin_calculator/config/globals.dart';

class USDtoBTCScreenone extends StatefulWidget {
  @override
  _USDtoBTCScreenoneState createState() => _USDtoBTCScreenoneState();
}

class _USDtoBTCScreenoneState extends State<USDtoBTCScreenone> {
  bool invalidinput = true;
  double BTC = 0.000000;
  Future<double> BTCvalue;

  @override
  void initState() {
    super.initState();
    BTCvalue = CalculationAPI.fetchValue(httpClient);
  }

  _setcurrentBTCValue(String text) async {
    double currentBTC = await BTCvalue;

    setState(() {
      if (double.tryParse(text) == null || double.tryParse(text) <= 0.00) {
        invalidinput = true;
        BTC = 0.000000;
      } else {
        invalidinput = false;
        double actualUSD = double.parse(text);
        double actualBTC = currentBTC;
        BTC = Calculation.USDtoBTC(actualBTC, actualUSD);
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: EdgeInsets.only(top: 300, left: 30, right: 30, bottom: 10),
          child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0)))),
              key: Key('usd-textfield'),
              keyboardType: TextInputType.number,
              onChanged: (enteredUSD) {
                _setcurrentBTCValue(enteredUSD);
                /* setState(() async* {
                  if (double.tryParse(enteredUSD) == null ||
                      double.tryParse(enteredUSD) <= 0.000000) {
                    invalidinput = true;
                    BTC = 0.000000;
                  } else {
                    invalidinput = false;
                    double actualUSD = double.parse(enteredUSD);
                    double currentBTC = await BTCvalue;
                    BTC = Calculation.USDtoBTC(currentBTC, actualUSD);
                  }
                });*/
              })),
      Container(
          width: 200,
          child: ElevatedButton(
              key: Key('usd-button-one'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            USDtoBTCScreentwo(invalidinput, BTC)));
              },
              child: Text("Convert")))
    ])));
  }
}
