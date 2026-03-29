// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tpc1/main.dart';

void main() {
  group('Acceptance Tests', () {
    testWidgets('CounterWidget acceptance test - increments correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that our counter starts at 0.
      expect(find.text('Value: 0'), findsOneWidget);
      expect(find.text('Value: 1'), findsNothing);

      // Tap the 'Increment' button.
      await tester.tap(find.byKey(const Key('increment_button')));
      await tester.pump();

      // Verify that our counter has incremented.
      expect(find.text('Value: 0'), findsNothing);
      expect(find.text('Value: 1'), findsOneWidget);
    });

    testWidgets('ToggleWidget acceptance test - toggles status correctly', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyApp());

      // Verify that the initial status is OFF.
      expect(find.text('Status: OFF'), findsOneWidget);
      expect(find.text('Status: ON'), findsNothing);

      // Tap the toggle switch.
      await tester.tap(find.byKey(const Key('toggle_switch')));
      await tester.pump();

      // Verify that the status changed to ON.
      expect(find.text('Status: OFF'), findsNothing);
      expect(find.text('Status: ON'), findsOneWidget);
      
      // Tap the toggle switch again.
      await tester.tap(find.byKey(const Key('toggle_switch')));
      await tester.pump();

      // Verify that the status changed back to OFF.
      expect(find.text('Status: OFF'), findsOneWidget);
      expect(find.text('Status: ON'), findsNothing);
    });
  });
}
