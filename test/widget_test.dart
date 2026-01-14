import 'package:flutter_test/flutter_test.dart';
import 'package:cx_payment_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    // Just verify it builds without crashing
    expect(find.byType(MyApp), findsOneWidget);
  });
}
