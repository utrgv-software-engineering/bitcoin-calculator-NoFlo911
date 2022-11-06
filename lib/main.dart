import 'package:flutter/material.dart';
import 'screens/btctousdscreen1.dart';
import 'screens/usdtobtcscreen1.dart';
import 'package:bitcoin_calculator/utils/calculations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BTC Calculator App',
      home: MyHomePage(title: 'BTC Calculator App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//  int _counter = 0;

//  void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BTC Calculator App Home Page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Padding(
                  padding: EdgeInsets.only(left: 100, right: 100),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => USDtoBTCScreenone()));
                      },
                      key: Key('usd-to-btc-button'),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.grey,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Container(
                          alignment: Alignment.center,
                          child: Text("USD to BTC",
                              style: TextStyle(color: Colors.black))))),
            ),
            Padding(
              padding: EdgeInsets.only(left: 100, right: 100),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BTCtoUSDScreenone()));
                  },
                  key: Key('btc-to-usd-button'),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                  child: Container(
                      alignment: Alignment.center,
                      child: Text("BTC to USD",
                          style: TextStyle(color: Colors.black)))),
              /*  Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              // Provide a Key to this specific Text widget. This allows
              // identifying the widget from inside the test suite,
              // and reading the text.
              key: Key('counter'),
              style: Theme.of(context).textTheme.headline4,
            ), */
            )
          ],
        ),
      ),
      /*  floatingActionButton: FloatingActionButton(
        // Provide a Key to this button. This allows finding this
        // specific button inside the test suite, and tapping it.
        key: Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/
    );
  }
}
