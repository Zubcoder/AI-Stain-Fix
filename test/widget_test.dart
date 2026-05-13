import 'package:flutter_test/flutter_test.dart';

import 'package:ai_stain_fix/main.dart';

void main() {
  testWidgets('App launches smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AIStainFixApp(onboardingDone: false));
    await tester.pump();

    expect(find.text('AI Stain Fix'), findsOneWidget);
  });
}
