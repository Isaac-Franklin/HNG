import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iabiacitizenapp/core/custom_animations.dart';
// import 'package:iabiacitizenapp/core/utils/device_utils.dart';
import 'package:iabiacitizenapp/l10n/app_localizations.dart';

class SlideC extends StatefulWidget {
  const SlideC({super.key});

  @override
  State<SlideC> createState() => _SlideCState();
}

class _SlideCState extends State<SlideC> with SingleTickerProviderStateMixin {
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            AnimationSet.fadeIn(
              controller: _controller,
              // begin: const Offset(0.0, 0.1),
              child: SizedBox(
                // height: DeviceUtils.screenHeight / 2,
                child: Image(image: AssetImage('assets/images/abiaroad2.png')),
              ),
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
                      AppLocalizations.of(context).slideThreeMainNote,
                      style: Theme.of(context).textTheme.displayLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'RNS',
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: Text(
                        AppLocalizations.of(context).slideThreeUnderNote,
                        style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(height: 20),

                    //
                    Center(
                      child: ElevatedButton.icon(
                        label: Row(
                          mainAxisSize:
                              MainAxisSize
                                  .min, // Ensures the button width is based on content
                          children: [
                            Text(AppLocalizations.of(context).nextstep),
                            SizedBox(width: 10),
                            Icon(Icons.arrow_forward, color: Colors.white),
                          ],
                        ),
                        onPressed: () {
                          context.go('/accesstype');
                        },
                        // child: Text('Continue'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
