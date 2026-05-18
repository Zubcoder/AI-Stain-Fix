import 'package:flutter_test/flutter_test.dart';

import 'package:ai_stain_fix/main.dart';

void main() {
  testWidgets('App launches smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const AIStainFixApp(onboardingDone: false));
    await tester.pump();

    // Advance past SplashScreen timer (2500ms)
    await tester.pumpAndSettle(const Duration(seconds: 3));
  });
}
