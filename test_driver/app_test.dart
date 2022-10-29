// Imports the Flutter Driver API.
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  // First, define the Finders and use them to locate widgets from the
  // test suite. Note: the Strings provided to the `byValueKey` method must
  // be the same as the Strings we used for the Keys in step 1.
  final counterTextFinder = find.byValueKey('counter');
  final buttonFinder = find.byValueKey('increment');

  FlutterDriver driver;

  // Connect to the Flutter driver before running any tests.
  setUpAll(() async {
    driver = await FlutterDriver.connect();
  });

  // Close the connection to the driver after the tests have completed.
  tearDownAll(() async {
    if (driver != null) {
      driver.close();
    }
  });

  //test('starts at 0', () async {
  // Use the `driver.getText` method to verify the counter starts at 0.
  // expect(await driver.getText(counterTextFinder), "0");
  //});

  //test('increments the counter', () async {
  // First, tap the button.
  // await driver.tap(buttonFinder);

  // Then, verify the counter text is incremented by 1.
  //  expect(await driver.getText(counterTextFinder), "1");
  // });

  group('Happy Paths', () {
    test("should calculate Bitcoin for 1.00 usd", () async {
      final USDtoBTCBtnFinder = find.byValueKey('usd-to-btc-button');

      final BTCtoUSDBtnFinder = find.byValueKey('btc-to-usd-button');

      final findTextField = find.byValueKey('usd-textfield');

      final convertBtnFinder = find.byValueKey('usd-button-one');

      final HappyText = find.byValueKey('correct-USD-text');

      final BTCText = find.byValueKey('btc-text');

      final homeBtn = find.byValueKey('home-usd-button');

      await driver.tap(USDtoBTCBtnFinder);

      await driver.tap(findTextField);

      await driver.enterText('1.00');

      await driver.waitFor(find.text('1.00'));

      await driver.tap(convertBtnFinder);

      expect(
          await driver.getText(HappyText), 'The conversion from USD to BTC:');

      expect(await driver.getText(BTCText), '0.000048');

      await driver.tap(homeBtn);
    });
    test("should calculate Bitcoin for 5.00 usd", () async {
      final USDtoBTCBtnFinder = find.byValueKey('usd-to-btc-button');

      final BTCtoUSDBtnFinder = find.byValueKey('btc-to-usd-button');

      final findTextField = find.byValueKey('usd-textfield');

      final convertBtnFinder = find.byValueKey('usd-button-one');

      final HappyText = find.byValueKey('correct-USD-text');

      final BTCText = find.byValueKey('btc-text');

      final homeBtn = find.byValueKey('home-usd-button');

      await driver.tap(USDtoBTCBtnFinder);

      await driver.tap(findTextField);

      await driver.enterText('5.00');

      await driver.waitFor(find.text('5.00'));

      await driver.tap(convertBtnFinder);

      expect(
          await driver.getText(HappyText), 'The conversion from USD to BTC:');

      expect(await driver.getText(BTCText), '0.000240');

      await driver.tap(homeBtn);
    });

    test("should calculate USD for 1.00 bitcoin", () async {
      final USDtoBTCBtnFinder = find.byValueKey('usd-to-btc-button');

      final BTCtoUSDBtnFinder = find.byValueKey('btc-to-usd-button');

      final findTextField = find.byValueKey('btc-textfield');

      final convertBtnFinder = find.byValueKey('btc-button-one');

      final HappyText = find.byValueKey('correct-BTC-text');

      final BTCText = find.byValueKey('usd-text');

      final homeBtn = find.byValueKey('home-btc-button');

      await driver.tap(BTCtoUSDBtnFinder);

      await driver.tap(findTextField);

      await driver.enterText('1.00');

      await driver.waitFor(find.text('1.00'));

      await driver.tap(convertBtnFinder);

      expect(
          await driver.getText(HappyText), 'The conversion from BTC to USD:');

      expect(await driver.getText(BTCText), '20355.80');

      await driver.tap(homeBtn);
    });

    test("should calculate USD for 5.00 bitcoin", () async {
      final USDtoBTCBtnFinder = find.byValueKey('usd-to-btc-button');

      final BTCtoUSDBtnFinder = find.byValueKey('btc-to-usd-button');

      final findTextField = find.byValueKey('btc-textfield');

      final convertBtnFinder = find.byValueKey('btc-button-one');

      final HappyText = find.byValueKey('correct-BTC-text');

      final BTCText = find.byValueKey('usd-text');

      final homeBtn = find.byValueKey('home-btc-button');

      await driver.tap(BTCtoUSDBtnFinder);

      await driver.tap(findTextField);

      await driver.enterText('5.00');

      await driver.waitFor(find.text('5.00'));

      await driver.tap(convertBtnFinder);

      expect(
          await driver.getText(HappyText), 'The conversion from BTC to USD:');

      expect(await driver.getText(BTCText), '101779.00');

      await driver.tap(homeBtn);
    });
  });

  group('Sad Paths', () {
    test("shouldn't calculate Bitcoin for 0.00 usd", () async {
      final USDtoBTCBtnFinder = find.byValueKey('usd-to-btc-button');

      final BTCtoUSDBtnFinder = find.byValueKey('btc-to-usd-button');

      final findTextField = find.byValueKey('usd-textfield');

      final convertBtnFinder = find.byValueKey('usd-button-one');

      final SadText = find.byValueKey('wrong-USD-text');

      final BTCText = find.byValueKey('btc-text');

      final homeBtn = find.byValueKey('home-usd-button');

      await driver.tap(USDtoBTCBtnFinder);

      await driver.tap(findTextField);

      await driver.enterText('0.00');

      await driver.waitFor(find.text('0.00'));

      await driver.tap(convertBtnFinder);

      expect(await driver.getText(SadText), 'Enter valid USD');

      expect(await driver.getText(BTCText), '0.000000');

      await driver.tap(homeBtn);
    });
    test("shouldn't calculate Bitcoin for -1.00 usd", () async {
      final USDtoBTCBtnFinder = find.byValueKey('usd-to-btc-button');

      final BTCtoUSDBtnFinder = find.byValueKey('btc-to-usd-button');

      final findTextField = find.byValueKey('usd-textfield');

      final convertBtnFinder = find.byValueKey('usd-button-one');

      final SadText = find.byValueKey('wrong-USD-text');

      final BTCText = find.byValueKey('btc-text');

      final homeBtn = find.byValueKey('home-usd-button');

      await driver.tap(USDtoBTCBtnFinder);

      await driver.tap(findTextField);

      await driver.enterText('-1.00');

      await driver.waitFor(find.text('-1.00'));

      await driver.tap(convertBtnFinder);

      expect(await driver.getText(SadText), 'Enter valid USD');

      expect(await driver.getText(BTCText), '0.000000');

      await driver.tap(homeBtn);
    });

    test("shouldn't calculate USD for 0.00 bitcoin", () async {
      final USDtoBTCBtnFinder = find.byValueKey('usd-to-btc-button');

      final BTCtoUSDBtnFinder = find.byValueKey('btc-to-usd-button');

      final findTextField = find.byValueKey('btc-textfield');

      final convertBtnFinder = find.byValueKey('btc-button-one');

      final SadText = find.byValueKey('wrong-BTC-text');

      final BTCText = find.byValueKey('usd-text');

      final homeBtn = find.byValueKey('home-btc-button');

      await driver.tap(BTCtoUSDBtnFinder);

      await driver.tap(findTextField);

      await driver.enterText('0.00');

      await driver.waitFor(find.text('0.00'));

      await driver.tap(convertBtnFinder);

      expect(await driver.getText(SadText), 'Enter valid BTC');

      expect(await driver.getText(BTCText), '0.00');

      await driver.tap(homeBtn);
    });

    test("shouldn't calculate USD for -1.00 bitcoin", () async {
      final USDtoBTCBtnFinder = find.byValueKey('usd-to-btc-button');

      final BTCtoUSDBtnFinder = find.byValueKey('btc-to-usd-button');

      final findTextField = find.byValueKey('btc-textfield');

      final convertBtnFinder = find.byValueKey('btc-button-one');

      final SadText = find.byValueKey('wrong-BTC-text');

      final BTCText = find.byValueKey('usd-text');

      final homeBtn = find.byValueKey('home-btc-button');

      await driver.tap(BTCtoUSDBtnFinder);

      await driver.tap(findTextField);

      await driver.enterText('-1.00');

      await driver.waitFor(find.text('-1.00'));

      await driver.tap(convertBtnFinder);

      expect(await driver.getText(SadText), 'Enter valid BTC');

      expect(await driver.getText(BTCText), '0.00');

      await driver.tap(homeBtn);
    });

    test("shouldn't calculate Bitcoin for symbols input by the user", () async {
      final USDtoBTCBtnFinder = find.byValueKey('usd-to-btc-button');

      final BTCtoUSDBtnFinder = find.byValueKey('btc-to-usd-button');

      final findTextField = find.byValueKey('usd-textfield');

      final convertBtnFinder = find.byValueKey('usd-button-one');

      final SadText = find.byValueKey('wrong-USD-text');

      final BTCText = find.byValueKey('btc-text');

      final homeBtn = find.byValueKey('home-usd-button');

      await driver.tap(USDtoBTCBtnFinder);

      await driver.tap(findTextField);

      await driver.enterText(',/.012');

      await driver.waitFor(find.text(',/.012'));

      await driver.tap(convertBtnFinder);

      expect(await driver.getText(SadText), 'Enter valid USD');

      expect(await driver.getText(BTCText), '0.000000');

      await driver.tap(homeBtn);
    });

    test("shouldn't calculate USD for symbols input by the user", () async {
      final USDtoBTCBtnFinder = find.byValueKey('usd-to-btc-button');

      final BTCtoUSDBtnFinder = find.byValueKey('btc-to-usd-button');

      final findTextField = find.byValueKey('btc-textfield');

      final convertBtnFinder = find.byValueKey('btc-button-one');

      final SadText = find.byValueKey('wrong-BTC-text');

      final BTCText = find.byValueKey('usd-text');

      final homeBtn = find.byValueKey('home-btc-button');

      await driver.tap(BTCtoUSDBtnFinder);

      await driver.tap(findTextField);

      await driver.enterText(',/.012');

      await driver.waitFor(find.text(',/.012'));

      await driver.tap(convertBtnFinder);

      expect(await driver.getText(SadText), 'Enter valid BTC');

      expect(await driver.getText(BTCText), '0.00');

      await driver.tap(homeBtn);
    });
  });
}
