import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
import 'package:iabiacitizenapp/core/custom_animations.dart';
import 'package:iabiacitizenapp/core/utils/device_utils.dart';
import 'package:iabiacitizenapp/l10n/app_localizations.dart';
import 'package:iabiacitizenapp/presentation/onboarding/login.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class OnboardTypeSelectionPage extends StatefulWidget {
  const OnboardTypeSelectionPage({super.key});

  @override
  State<OnboardTypeSelectionPage> createState() =>
      _OnboardTypeSelectionPageState();
}

class _OnboardTypeSelectionPageState extends State<OnboardTypeSelectionPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationSet.scale(
        controller: _controller,
        // begin: const Offset(0.0, 0.4),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: AppSizes.spacingXL),
                  Image(
                    image: AssetImage('assets/images/iabialogo.png'),
                    width: 200,
                  ),
                  SizedBox(height: 10),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context).getStarted,
                        style: Theme.of(context).textTheme.bodySmall,
                        // textAlign: TextAlign.center,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'iAbia 👋',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // GOOGLE SIGNIN
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 233, 233, 233),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/icons/google.png'),
                          width: 20,
                        ),
                        SizedBox(width: 20),
                        Text(
                          AppLocalizations.of(context).googlesignin,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // FACEBOOK SIGNIN
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 233, 233, 233),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/icons/facebook.png'),
                          width: 20,
                        ),
                        SizedBox(width: 20),
                        Text(
                          AppLocalizations.of(context).facebooksignin,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),

                  // INSTAGRAM SIGNIN
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Color.fromARGB(255, 233, 233, 233),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage('assets/icons/apple.png'),
                          width: 20,
                        ),
                        SizedBox(width: 20),
                        Text(
                          AppLocalizations.of(context).applesignin,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),

                  // signin with password button here
                  SizedBox(height: 20),

                  SizedBox(
                    // width: DeviceUtils.screenWidth,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: Size(DeviceUtils.screenWidth, 20),
                        foregroundColor: AppColors.primary,
                        backgroundColor: AppColors.primary,
                        padding: EdgeInsets.all(10),
                        elevation: 0,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return LoginPage();
                            },
                          ),
                        );
                        // context.go('/login');
                      },
                      child: Text(
                        AppLocalizations.of(context).passwordsignin,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // sigup button here
                  SizedBox(height: 10),
                ],
              ),
            ),

            Positioned(
              bottom: 40,
              right: 0,
              left: 0,
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: '${AppLocalizations.of(context).newhere} ',
                    style: Theme.of(context).textTheme.bodySmall,
                    children: <TextSpan>[
                      TextSpan(
                        text: AppLocalizations.of(context).register,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                          decorationColor: AppColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
