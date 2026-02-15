import 'package:flutter_test/flutter_test.dart';
import 'package:fixio/app.dart';

void main() {
  testWidgets('Fixio app builds without crashing',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // If MyApp builds, the test passes
    expect(find.byType(MyApp), findsOneWidget);
  });
}