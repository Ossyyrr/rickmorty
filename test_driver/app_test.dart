import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group("integration test", () {
    late FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      driver.close();
    });

    test("Entrar en el detalle de Rick, volver atrás y entrar en el detalle de Morty", () async {
      await driver.tap(find.text("Rick Sanchez"));
      await driver.waitFor(find.text("Rick Sanchez"));
      await driver.tap(find.byValueKey('characterBack'));
      await driver.waitFor(find.text("Morty Smith"));
    });
  });
}
