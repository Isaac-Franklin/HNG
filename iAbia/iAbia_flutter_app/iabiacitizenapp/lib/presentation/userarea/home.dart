import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/core/custom_animations.dart';
import 'package:iabiacitizenapp/core/utils/device_utils.dart';
import 'package:iabiacitizenapp/presentation/shared/custom_app_bar.dart';
import 'package:iabiacitizenapp/presentation/userarea/widgets/categoryfilterbuttons.dart';
import 'package:iabiacitizenapp/presentation/userarea/widgets/trendingissues.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
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

  List regions = [
    'All',
    'Aba North',
    'Aba South',
    'Bende',
    'Arochukwu',
    'Isiala Ngwa',
    'Okigwe',
    'Ohafia',
  ];

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      showBackButton: false,
      centerTitle: true,

      body: AnimationSet.staggeredFadeSlideIn(
        controller: _controller,
        child: Scaffold(
          body: Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // intro

                    // responded text
                    SizedBox(height: AppSizes.spacingS),
                    RichText(
                      text: TextSpan(
                        text: 'Welcome ',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(fontSize: 14),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Franklin ',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                              fontSize: 14,
                              decorationColor: AppColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          TextSpan(
                            text: '👋',
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall?.copyWith(fontSize: 15),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: AppSizes.spacingS),
                    // REPORT BOX
                    Form(
                      child: TextFormField(
                        style: Theme.of(
                          context,
                        ).textTheme.bodyMedium?.copyWith(fontSize: 14),
                        // controller: _emailController,
                        decoration: InputDecoration(
                          // fillColor: const Color.fromARGB(255, 244, 244, 244),
                          prefixIcon: Icon(Icons.newspaper, size: 20),
                          label: Text(
                            'What would you like to report?',
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
                    ),

                    SizedBox(height: AppSizes.spacingS),

                    // Filter
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: ScrollPhysics(),
                        itemCount: regions.length,
                        itemBuilder: (context, index) {
                          return CategoryFilterButtonsSection(
                            categoryTitle: regions[index],
                          );
                        },
                      ),
                    ),

                    // TRENDING ISSUES SECTION
                    SizedBox(height: AppSizes.spacingS),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Recent responses',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(fontSize: 16),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 2,
                            vertical: 0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.all(2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            label: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Search responses',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primary,
                                  ),
                                ),
                                SizedBox(width: 5),
                                Icon(Icons.search, color: AppColors.primary),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    TrendingIssues(),
                    TrendingIssues(),
                    TrendingIssues(),
                    TrendingIssues(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      title: Image(
        width: 100,
        image: AssetImage('assets/images/iabialogonobg.png'),
      ),
    );
  }
}
