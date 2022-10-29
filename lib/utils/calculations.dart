class Calculation {
  static double USDtoBTC(double usd) {
    if (usd <= 0.0) {
      throw ArgumentError();
    }
    return double.parse((usd * (0.000048)).toStringAsFixed(6));
  }

  static double BTCtoUSD(double btc) {
    if (btc <= 0.0) {
      throw ArgumentError();
    }
    return double.parse((btc * (20355.80)).toStringAsFixed(2));
  }
}
