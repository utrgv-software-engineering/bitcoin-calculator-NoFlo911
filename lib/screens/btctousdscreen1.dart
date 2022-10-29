import 'package:flutter/material.dart';
import 'package:bitcoin_calculator/main.dart';
import 'package:bitcoin_calculator/utils/calculations.dart';
import 'btctousdscreen2.dart';

class BTCtoUSDScreenone extends StatefulWidget {
  @override
  _BTCtoUSDScreenoneState createState() => _BTCtoUSDScreenoneState();
}

class _BTCtoUSDScreenoneState extends State<BTCtoUSDScreenone> {
  bool invalidinput = false;
  double USD = 0.00;
  @override
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
              key: Key('btc-textfield'),
              keyboardType: TextInputType.number,
              onChanged: (enteredBTC) {
                setState(() {
                  if (double.tryParse(enteredBTC) == null ||
                      double.tryParse(enteredBTC) <= 0.00) {
                    invalidinput = true;
                    USD = 0.00;
                  } else {
                    invalidinput = false;
                    USD = Calculation.BTCtoUSD(double.tryParse(enteredBTC));
                  }
                });
              })),
      Container(
          width: 200,
          child: ElevatedButton(
              key: Key('btc-button-one'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            BTCtoUSDScreentwo(invalidinput, USD)));
              },
              child: Text("Convert")))
    ])));
  }
}
