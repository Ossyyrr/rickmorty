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

    final SerializableFinder rickSanchez = find.text("Rick Sanchez");

    test("Entrar en el detalle de Rick", () async {
      await driver.tap(rickSanchez);
      await driver.waitFor(find.text("Rick Sanchez"));
    });
  });
}
