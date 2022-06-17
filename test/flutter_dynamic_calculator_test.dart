import 'package:flutter/material.dart';
import 'package:flutter_dynamic_calculator/flutter_dynamic_calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('widget test', (WidgetTester tester) async {
    String? currentKey;
    double? currentVal;
    var calc = DynamicCalculator(
      value: 123,
      hideExpression: false,
      onChanged: (key, value, expression) {
        currentKey = key;
        currentVal = value;
      },
    );
    var app = MaterialApp(
      home: calc,
    );
    await tester.pumpWidget(app);
    await tester.tap(find.widgetWithText(TextButton, '1'));
    expect(currentKey, equals('1'));
    expect(currentVal, equals(1231.0));
    await tester.tap(find.widgetWithText(TextButton, '+'));
    expect(currentKey, equals('+'));
    await tester.tap(find.widgetWithText(TextButton, '9'));
    expect(currentKey, equals('9'));
    expect(currentVal, equals(9.0));
    await tester.tap(find.widgetWithText(TextButton, '='));
    expect(currentKey, equals('='));
    expect(currentVal, equals(1240.0));
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.widgetWithText(TextButton, 'AC'));
    expect(currentKey, equals('AC'));
    expect(currentVal, equals(0.0));
  });
}
