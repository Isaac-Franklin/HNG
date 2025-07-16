// ignore: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/presentation/onboarding/widgets/slide_page_one.dart';
import 'package:iabiacitizenapp/presentation/onboarding/widgets/slide_page_three.dart';
import 'package:iabiacitizenapp/presentation/onboarding/widgets/slide_page_two.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AppIntro extends StatefulWidget {
  const AppIntro({super.key});

  @override
  State<AppIntro> createState() => _AppIntroState();
}

class _AppIntroState extends State<AppIntro> {
  final PageController _controller = PageController();
  // int _counter = 3;
  // late Timer _timer;
  // String _selectedLanguage = 'English'; // Default selected
  // bool _hasShownLanguageDialog = false;

  // void _startCountdown() {
  //   _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
  //     if (_counter > 1) {
  //       setState(() {
  //         _counter--;
  //       });
  //     } else {
  //       // context.read<OnboardingBloc>().add(DisplayLanguageSelectionEvent());
  //       // _timer.cancel();
  //       // Optional: Trigger an action after countdown ends
  //       // Navigator.pushReplacementNamed(context, '/nextPage');
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // _startCountdown();
    Future.delayed(Duration(seconds: 1), () {
      if (!mounted) return;
      // context.read<OnboardingBloc>().add(MarkSplashSeen());
    });
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
          Expanded(
            child: PageView(
              controller: _controller,
              children: const [
                Center(child: SlideA()),
                Center(child: SlideB()),
                Center(child: SlideC()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 3,
              effect: WormEffect(
                dotHeight: 5,
                dotWidth: 30,
                spacing: 8,
                activeDotColor: AppColors.primary,
              ),
            ),
          ),

          //

          // BlocBuilder<OnboardingBloc, OnboardingBloc>(
          //   builder: (context, state) {
          //     return ;
          //   },
          // ),
        ],
      ),
    );
  }
}
