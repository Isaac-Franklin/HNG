import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/core/custom_animations.dart';
import 'package:iabiacitizenapp/l10n/app_localizations.dart';

class SlideA extends StatefulWidget {
  const SlideA({super.key});

  @override
  State<SlideA> createState() => _SlideAState();
}

class _SlideAState extends State<SlideA> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AnimationSet.fadeIn(
            controller: _controller,
            // begin: const Offset(0.0, 0.1),
            child: Image.asset('assets/images/abiaroad2.png'),
          ),
          AnimationSet.slideIn(
            controller: _controller,
            begin: const Offset(0.0, 0.1),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    AppLocalizations.of(context).welcometo,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RNS',
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      AppLocalizations.of(context).slideOneUnderNote,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
