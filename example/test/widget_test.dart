// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_to_airplay_example/main.dart';

void main() {
  testWidgets('Shows the app bar title and example list', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that the app bar title and the example entries are shown.
    expect(find.text('Flutter 2 Airplay'), findsOneWidget);
    expect(find.text('Video from Asset'), findsOneWidget);
    expect(find.text('Video from File'), findsOneWidget);
    expect(find.text('Video from URL'), findsOneWidget);
    expect(find.text('Custom Icon'), findsOneWidget);
  });
}
