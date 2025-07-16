import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:iabiacitizenapp/core/utils/device_utils.dart';
import 'package:iabiacitizenapp/l10n/app_localizations.dart';
import 'package:iabiacitizenapp/presentation/bloc/app_state_bloc.dart';
import 'package:iabiacitizenapp/presentation/onboarding/bloc/onboarding_bloc.dart';
import 'package:iabiacitizenapp/presentation/userarea/bloc/usernavigation_bloc.dart';
import 'package:iabiacitizenapp/router/app_router.dart';
import 'package:iabiacitizenapp/theme/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final startupBloc = OnboardingBloc();
  final navigationBloc = UsernavigationBloc();
  final appStateBloc = AppStateBloc();

  // Load saved locale
  // final prefs = await SharedPreferences.getInstance();
  // final savedLocaleCode = prefs.getString('locale');
  Locale initialLocale = Locale('en');
  // Locale initialLocale =
  //     savedLocaleCode != null ? Locale(savedLocaleCode) : const Locale('en');
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider.value(value: startupBloc),
        BlocProvider.value(value: navigationBloc),
        BlocProvider.value(value: appStateBloc),
      ],
      child: MyApp(
        startupBloc: startupBloc,
        navigationBloc: navigationBloc,
        appStateBloc: appStateBloc,
        initialLocale: initialLocale,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  final OnboardingBloc startupBloc;
  final UsernavigationBloc navigationBloc;
  final AppStateBloc appStateBloc;
  final Locale initialLocale;

  const MyApp({
    super.key,
    required this.startupBloc,
    required this.navigationBloc,
    required this.initialLocale,
    required this.appStateBloc,
  });

  @override
  State<MyApp> createState() => _MyAppState();
  // Allow child widgets to access state
  static _MyAppState? of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  late Locale _locale;
  late final GoRouter _router;

  @override
  void initState() {
    super.initState();
    _locale = widget.initialLocale;

    /// 🧠 Create router ONCE during widget initialization
    _router = createRouter(widget.startupBloc, widget.navigationBloc);
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('locale', locale.languageCode);
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    DeviceUtils.init(context);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router, // ✅ Use cached router here
      title: 'iAbia Citizen App',
      theme: AppTheme.getLight(),
      darkTheme: AppTheme.getDark(),
      themeMode: ThemeMode.light,
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale('en'), Locale('ig')],
    );
  }
}
