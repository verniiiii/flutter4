// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:prac4/main.dart';

void main() {
  testWidgets('Navigation between screens works', (WidgetTester tester) async {
    await tester.pumpWidget(const RecipeApp());

    // Initially on Column screen
    expect(find.text('Список: Column'), findsOneWidget);

    // Tap on ListView in bottom navigation
    await tester.tap(find.text('ListView'));
    await tester.pumpAndSettle();

    // Now should be on ListView screen
    expect(find.text('Список: ListView'), findsOneWidget);

    // Tap on Separated in bottom navigation
    await tester.tap(find.text('Separated'));
    await tester.pumpAndSettle();

    // Now should be on Separated screen
    expect(find.text('Список: ListView.separated'), findsOneWidget);
  });

  testWidgets('Add recipe functionality works', (WidgetTester tester) async {
    await tester.pumpWidget(const RecipeApp());

    // Count initial number of recipes
    final initialCardCount = find.byType(Card).evaluate().length;

    // Tap the add button
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    // Verify that a new recipe was added
    expect(find.byType(Card).evaluate().length, greaterThan(initialCardCount));
  });
}