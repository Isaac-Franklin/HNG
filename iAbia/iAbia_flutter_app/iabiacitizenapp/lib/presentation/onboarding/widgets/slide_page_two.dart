import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/core/custom_animations.dart';
import 'package:iabiacitizenapp/l10n/app_localizations.dart';

class SlideB extends StatefulWidget {
  const SlideB({super.key});

  @override
  State<SlideB> createState() => _SlideBState();
}

class _SlideBState extends State<SlideB> with SingleTickerProviderStateMixin {
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
            child: Image.asset('assets/images/abiaroad1.png'),
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
                    AppLocalizations.of(context).slideTwoMainNote,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'RNS',
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      AppLocalizations.of(context).slideTwoUnderNote,
                      // 'Report issues, suggest solutions, and watch \nyour community grow—together.',
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
