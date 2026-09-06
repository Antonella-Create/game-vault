import 'package:flutter_test/flutter_test.dart';
import 'package:game_vault/main.dart';

void main() {
  testWidgets('GameVault smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const GameVaultApp());
    expect(find.text('GAMEVAULT'), findsOneWidget);
  });
}