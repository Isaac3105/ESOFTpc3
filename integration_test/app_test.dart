import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:tpc1/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('E2E Acceptance Tests', () {
    testWidgets('NavigationWidget E2E test - navigates correctly', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify that the second page text is not on the screen.
      expect(find.text('not original page'), findsNothing);

      // Tap the navigation button.
      await tester.tap(find.byKey(const Key('navigation_button')));
      await tester.pumpAndSettle();

      // Verify that the second page text is now visible.
      expect(find.text('not original page'), findsOneWidget);
    });

    testWidgets('ToggleWidget E2E test - toggles status correctly', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify that the initial status is OFF.
      expect(find.text('Status: OFF'), findsOneWidget);
      expect(find.text('Status: ON'), findsNothing);

      // Tap the toggle switch.
      await tester.tap(find.byKey(const Key('toggle_switch')));
      await tester.pumpAndSettle();

      // Verify that the status changed to ON.
      expect(find.text('Status: OFF'), findsNothing);
      expect(find.text('Status: ON'), findsOneWidget);
      
      // Tap the toggle switch again.
      await tester.tap(find.byKey(const Key('toggle_switch')));
      await tester.pumpAndSettle();

      // Verify that the status changed back to OFF.
      expect(find.text('Status: OFF'), findsOneWidget);
      expect(find.text('Status: ON'), findsNothing);
    });

    testWidgets('InputEchoWidget E2E test - echoes text correctly', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      // Verify that the initial echo text is empty.
      expect(find.text('Echo: '), findsOneWidget);

      // Enter text into the TextField.
      await tester.enterText(find.byKey(const Key('echo_text_field')), 'Hello Flutter!');
      await tester.pumpAndSettle();

      // Close the keyboard to ensure the submit button is visible
      FocusManager.instance.primaryFocus?.unfocus();
      await tester.pumpAndSettle();

      // Ensure the button is visible and tap it
      final submitButton = find.byKey(const Key('echo_submit_button'));
      await tester.ensureVisible(submitButton);
      await tester.pumpAndSettle();
      
      // Tap the submit button.
      await tester.tap(submitButton);
      await tester.pumpAndSettle();

      // Verify that the text was echoed.
      expect(find.text('Echo: Hello Flutter!'), findsOneWidget);
    });
  });
}
