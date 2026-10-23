import 'package:flutter_test/flutter_test.dart';

import 'package:pry_tarea2/main.dart';

void main() {
  testWidgets('Muestra la pantalla de inicio de sesión', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Calculadora de Subredes'), findsOneWidget);
    expect(find.text('Inicia sesión para continuar'), findsOneWidget);
    expect(find.text('Iniciar sesión'), findsOneWidget);
  });
}
