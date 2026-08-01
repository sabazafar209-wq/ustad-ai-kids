import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:ustad_ai_kids/app/app.dart';

void main() {
  testWidgets('app builds successfully', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: UstadAIKidsApp(),
      ),
    );

    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
