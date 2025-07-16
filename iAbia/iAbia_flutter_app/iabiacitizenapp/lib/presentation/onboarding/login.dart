import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iabiacitizenapp/core/custom_animations.dart';
import 'package:iabiacitizenapp/core/utils/device_utils.dart';
import 'package:iabiacitizenapp/l10n/app_localizations.dart';
// import 'package:iabiacitizenapp/l10n/app_localizations.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _profileFormFilled = false;

  @override
  void initState() {
    _emailController.addListener(_checkForm);
    _passwordController.addListener(_checkForm);
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();
  }

  void _checkForm() {
    setState(() {
      _profileFormFilled =
          _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty;
      // _emailController.text.isNotEmpty ||
      // _phoneController.text.isNotEmpty ||
      // _addressController.text.isNotEmpty;
      // _ischecked;
    });
    print(_profileFormFilled);
  }

  // void _updateProfilePrompt() {
  //   context.read<MemberareasBloc>().add(
  //     UpdateProfileData(
  //       name: _nameController.text,
  //       email: _emailController.text,
  //       phone: _phoneController.text,
  //       location: _addressController.text,
  //     ),
  //   );
  // }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    // _emailController.dispose();
    // _emailController.dispose();
    // _phoneController.dispose();
    // _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(leading: Icon(Icons.arrow_back)),
      body: AnimationSet.slideIn(
        controller: _controller,
        begin: const Offset(0.0, 0.1),
        child: Padding(
          padding: EdgeInsets.all(0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: DeviceUtils.screenHeight / 3,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/onboardtopbg.png',
                          ), // Use NetworkImage for online image
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${AppLocalizations.of(context).welcome} 👋',
                                // 'Welcome 👋',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  text:
                                      AppLocalizations.of(
                                        context,
                                      ).getStarted, // first part
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodySmall?.copyWith(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: ' iAbia',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Image(image: AssetImage('assets/images/onboardtopbg.png')),
                    Positioned(
                      top: 60,
                      left: 10,
                      child: GestureDetector(
                        onTap: () {
                          return context.go('/accesstype');
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                // form starts here
                Form(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppSizes.spacingXL),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context).enteremailaddress,
                                textAlign: TextAlign.left,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(fontSize: 14),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(fontSize: 16),
                                controller: _emailController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email_outlined,
                                    size: 20,
                                  ),
                                  label: Text(
                                    'eg: emeka@gmail.com',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  // helperText:
                                  //     AppLocalizations.of(
                                  //       context,
                                  //     ).kindlyenteremailaddress,
                                  contentPadding: const EdgeInsets.all(10),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: AppColors.primary,
                                      width: 1.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),

                              // space
                              const SizedBox(height: 20),

                              // password
                              Text(
                                AppLocalizations.of(context).enterpassword,
                                textAlign: TextAlign.left,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(fontSize: 14),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
                                style: Theme.of(
                                  context,
                                ).textTheme.bodyMedium?.copyWith(fontSize: 16),
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.password_outlined,
                                    size: 20,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.remove_red_eye,
                                    color: Colors.grey,
                                  ),
                                  label: Text(
                                    'eg: abiacivic123@',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.all(10),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: AppColors.primary,
                                      width: 2.0,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),

                              // REMEMBER ME
                              Row(
                                children: [
                                  Text(
                                    AppLocalizations.of(context).forgotpassword,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),

                              SizedBox(height: AppSizes.spacingXL),

                              // button
                              SizedBox(
                                width: DeviceUtils.screenWidth,
                                child: ElevatedButton(
                                  onPressed: () {
                                    context.go('/home');
                                  },
                                  child: Text(
                                    AppLocalizations.of(context).nextstep,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // signup
                        SizedBox(height: AppSizes.spacingXL),

                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                '${AppLocalizations.of(context).noaccount} ', // first part
                            style: Theme.of(context).textTheme.bodySmall,
                            children: <TextSpan>[
                              TextSpan(
                                text: AppLocalizations.of(context).signup,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary,
                                  decorationColor: AppColors.primary,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
