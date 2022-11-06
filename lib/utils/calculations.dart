import 'package:http/http.dart' as http;
import 'dart:convert';

class CalculationAPI {
  static Future<double> fetchValue(http.Client client) async {
    var url =
        Uri.parse('https://api.coindesk.com/v1/bpi/currentprice/usd.json');
    final response = await client.get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return json["bpi"]["USD"]["rate_float"];
    } else {
      throw Exception('Failed to load value');
    }
  }
}

class Calculation {
  static double USDtoBTC(double currentbtcrate, double usd) {
    if (usd <= 0.0) {
      throw ArgumentError();
    }
    return double.parse(((usd) / (currentbtcrate)).toStringAsFixed(6));
  }

  static double BTCtoUSD(double currentbtcrate, double btc) {
    if (btc <= 0.0) {
      throw ArgumentError();
    }
    return double.parse(((btc) * (currentbtcrate)).toStringAsFixed(2));
  }
}
