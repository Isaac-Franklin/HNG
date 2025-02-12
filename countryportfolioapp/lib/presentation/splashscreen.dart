// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigateToNextScreen();
  }

// Swipe screen if onboarding is done
  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const HomePage();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
        ),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Country Data App',
                // style: Theme.of(context).tex ,
              ),
              SizedBox(height: 20),
              Image(
                image: AssetImage('assets/images/hnglogo.png'),
                width: 200,
                height: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
