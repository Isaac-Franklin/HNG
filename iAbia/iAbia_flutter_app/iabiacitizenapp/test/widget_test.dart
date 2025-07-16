// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:iabiacitizenapp/main.dart';
import 'package:iabiacitizenapp/presentation/bloc/app_state_bloc.dart';
import 'package:iabiacitizenapp/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:iabiacitizenapp/presentation/userarea/bloc/usernavigation_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final startupBloc = OnboardingBloc();
  final navigationBloc = UsernavigationBloc();
  final appStateBloc = AppStateBloc();
  // Load saved locale
  final prefs = await SharedPreferences.getInstance();
  final savedLocaleCode = prefs.getString('locale');
  Locale initialLocale =
      savedLocaleCode != null ? Locale(savedLocaleCode) : const Locale('en');
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MyApp(
        startupBloc: startupBloc,
        navigationBloc: navigationBloc,
        initialLocale: initialLocale,
        appStateBloc: appStateBloc,
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
