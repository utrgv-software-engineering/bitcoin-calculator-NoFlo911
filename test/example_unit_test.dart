import 'package:bitcoin_calculator/config/globals.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:bitcoin_calculator/utils/calculations.dart';

void main() {
  // test('2 plus 2 is 4', () {
  //  int result = 2 + 2;
  //  expect(result, 4);
  // });

  group("usd to btc calculation", () {
    test('throws ArgumentError on zero', () async {
      double currentBTCvalue = await CalculationAPI.fetchValue(httpClient);
      expect(() => Calculation.USDtoBTC(currentBTCvalue, 0.0),
          throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () async {
      double currentBTCvalue = await CalculationAPI.fetchValue(httpClient);
      expect(() => Calculation.USDtoBTC(currentBTCvalue, -1.0),
          throwsArgumentError);
    });

    test('calculates btc for 1 usd', () async {
      double currentBTCvalue = await CalculationAPI.fetchValue(httpClient);
      var btc = Calculation.USDtoBTC(currentBTCvalue, 1.0);
      expect(btc, double.parse(((1.0) / (currentBTCvalue)).toStringAsFixed(6)));
    });
    test('calculates btc for 5 usd', () async {
      double currentBTCvalue = await CalculationAPI.fetchValue(httpClient);
      var btc = Calculation.USDtoBTC(currentBTCvalue, 5.0);
      expect(btc, double.parse(((5.0) / (currentBTCvalue)).toStringAsFixed(6)));
    });

    test('calculates btc for 10.67 usd', () async {
      double currentBTCvalue = await CalculationAPI.fetchValue(httpClient);
      var btc = Calculation.USDtoBTC(currentBTCvalue, 10.67);
      expect(
          btc, double.parse(((10.67) / (currentBTCvalue)).toStringAsFixed(6)));
    });
  });

  group("btc to usd calculation", () {
    test('throws ArgumentError on zero', () async {
      double currentBTCvalue = await CalculationAPI.fetchValue(httpClient);
      expect(() => Calculation.BTCtoUSD(currentBTCvalue, 0.0),
          throwsArgumentError);
    });

    test('throws ArgumentError on negative number', () async {
      double currentBTCvalue = await CalculationAPI.fetchValue(httpClient);
      expect(() => Calculation.BTCtoUSD(currentBTCvalue, -1.0),
          throwsArgumentError);
    });

    test('calculates usd for 1 btc', () async {
      double currentBTCvalue = await CalculationAPI.fetchValue(httpClient);
      var btc = Calculation.BTCtoUSD(currentBTCvalue, 1.0);
      expect(btc, double.parse(((1.0) * (currentBTCvalue)).toStringAsFixed(2)));
    });
    test('calculates usd for 5 btc', () async {
      double currentBTCvalue = await CalculationAPI.fetchValue(httpClient);
      var btc = Calculation.BTCtoUSD(currentBTCvalue, 5.0);
      expect(btc, double.parse(((5.0) * (currentBTCvalue)).toStringAsFixed(2)));
    });

    test('calculates usd for 10.67 btc', () async {
      double currentBTCvalue = await CalculationAPI.fetchValue(httpClient);
      var btc = Calculation.BTCtoUSD(currentBTCvalue, 10.67);
      expect(
          btc, double.parse(((10.67) * (currentBTCvalue)).toStringAsFixed(2)));
    });
  });
}
