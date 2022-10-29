import 'package:test/test.dart';
import 'package:bitcoin_calculator/utils/calculations.dart';

void main() {
  // test('2 plus 2 is 4', () {
  //  int result = 2 + 2;
  //  expect(result, 4);
  // });

  group("usd to btc calculation", () {
    test('throws ArgumentError on zero', () {
      expect(() => Calculation.USDtoBTC(0.0), throwsArgumentError);
    });
    test('throws ArgumentError on negative number', () {
      expect(() => Calculation.USDtoBTC(-1.0), throwsArgumentError);
    });

    test('calculates btc for 1 usd', () {
      var btc = Calculation.USDtoBTC(1.0);
      expect(btc, 0.000048);
    });

    test('calculates btc for 5 usd', () {
      var btc = Calculation.USDtoBTC(5.0);
      expect(btc, 0.000240);
    });

    test('calculates btc for 10.67 usd', () {
      var btc = Calculation.USDtoBTC(10.67);
      expect(btc, 0.000512);
    });
  });

  group("btc to usd calculation", () {
    test('throws ArgumentError on zero', () {
      expect(() => Calculation.BTCtoUSD(0.0), throwsArgumentError);
    });
    test('throws ArgumentError on negative number', () {
      expect(() => Calculation.BTCtoUSD(-1.0), throwsArgumentError);
    });

    test('calculates btc for 1 usd', () {
      var btc = Calculation.BTCtoUSD(1.0);
      expect(btc, 20355.80);
    });

    test('calculates btc for 5 usd', () {
      var btc = Calculation.BTCtoUSD(5.0);
      expect(btc, 101779.00);
    });

    test('calculates btc for 10.67 usd', () {
      var btc = Calculation.BTCtoUSD(10.67);
      expect(btc, 217196.39);
    });
  });
}
