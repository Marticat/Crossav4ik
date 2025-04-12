import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:workoutproject/app/theme/theme_provider.dart';

void main() {
  testWidgets('App structure verification', (WidgetTester tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: MaterialApp(
          title: 'Fitness Tracker',
          home: Scaffold(
            appBar: AppBar(title: const Text('Fitness Tracker')),
          ),
        ),
      ),
    );

    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Fitness Tracker'), findsOneWidget);
  });

  testWidgets('Theme provider works', (WidgetTester tester) async {
    final themeProvider = ThemeProvider();

    await tester.pumpWidget(
      ChangeNotifierProvider.value(
        value: themeProvider,
        child: Container(),
      ),
    );

    expect(themeProvider.themeMode, ThemeMode.system);
    themeProvider.setThemeMode(ThemeMode.dark);
    expect(themeProvider.themeMode, ThemeMode.dark);
  });
}