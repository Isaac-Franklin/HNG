import 'package:countryportfolioapp/presentation/home.dart';
import 'package:countryportfolioapp/theme/theme_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'presentation/splashscreen.dart';
import 'presentation/bloc/home_bloc.dart';
import 'services/repository.dart';
import 'theme/theme_manager.dart';

final RepositoryServices repositoryServices = RepositoryServices();

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => HomeBloc(repositoryServices),
      ),
      // BlocProvider(
      //   create: (context) => SubjectBloc(),
      // ),
    ],
    child: const MyApp(),
  ));
}

// create instance of themeManager to manager the switch btn light and dark theme modes
ThemeManager _themeManager = ThemeManager();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    _themeManager.addListener(themeListener);
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode,
      home: const HomePage(),
      // home: const SplashScreen(),
    );
  }
}
