import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:bitcoin_calculator/utils/calculations.dart';
import 'package:bitcoin_calculator/config/globals.dart' as globals;

class MockClient extends Mock implements http.Client {}

main() {
  test('returns a value if the http call completes successfully', () async {
    final client = MockClient();
    final bitcoinvalueAPIdata =
        '{"time":{"updated":"Nov 5, 2020 19:01:00 UTC","updatedISO":"2020-11-05T19:01:00+00:00","updateduk":"Nov 5, 2020 at 19:01 GMT"},"disclaimer": "This data was produced from the CoinDesk Bitcoin Price Index (USD). Non-USD currency data converted using hourly conversion rate from openexchangerates.org","bpi":{"USD":{"code":"USD","rate":"14,93.5833","description": "United States Dollar","rate_float": 14934.5833}}}';
    var url =
        Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');
    when(client.get(url))
        .thenAnswer((_) async => http.Response(bitcoinvalueAPIdata, 200));
    double value = await CalculationAPI.fetchValue(client);
    expect(value, isA<double>());
    expect(value, 14934.5833);
  });

  test('throws an exception if the http call completes with an error', () {
    final client = MockClient();
    var url =
        Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');
    when(client.get(url))
        .thenAnswer((_) async => http.Response('Not Found', 404));
    expect(CalculationAPI.fetchValue(client), throwsException);
  });
}
