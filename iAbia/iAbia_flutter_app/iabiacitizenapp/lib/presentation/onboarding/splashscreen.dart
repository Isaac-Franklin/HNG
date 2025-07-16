import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iabiacitizenapp/core/custom_animations.dart';
import 'package:iabiacitizenapp/l10n/app_localizations.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';
// import

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _counter = 4;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
    navigateToNextScreen();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_counter > 1) {
        setState(() {
          _counter--;
        });
      } else {
        _timer.cancel();
        // Optional: Trigger an action after countdown ends
        // Navigator.pushReplacementNamed(context, '/nextPage');
      }
    });
  }

  Future<void> navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 4));
    if (!mounted) return;
    context.go('/appintro');
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Center(
                child: AnimationSet.fadeIn(
                  controller: _controller,
                  child: Image.asset('assets/images/iabialogo.png'),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: AnimationSet.fadeSlideIn(
                  controller: _controller,
                  begin: const Offset(0.0, 0.4),
                  child: Text(
                    AppLocalizations.of(context).teamNote,
                    // 'Powered by BlueTech Innovations Team',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ),
            ),

            Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 7, vertical: 2),

                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  '$_counter',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
