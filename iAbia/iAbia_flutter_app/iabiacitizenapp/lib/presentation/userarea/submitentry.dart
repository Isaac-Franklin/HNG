import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iabiacitizenapp/core/custom_animations.dart';
import 'package:iabiacitizenapp/core/utils/device_utils.dart';
import 'package:iabiacitizenapp/presentation/shared/custom_app_bar.dart';
import 'package:iabiacitizenapp/presentation/userarea/widgets/reportissues.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class SubmitEntry extends StatefulWidget {
  const SubmitEntry({super.key});

  @override
  State<SubmitEntry> createState() => _SubmitEntryState();
}

class _SubmitEntryState extends State<SubmitEntry>
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
    return CustomAppBar(
      title: Image(
        width: 100,
        image: AssetImage('assets/images/iabialogonobg.png'),
      ),
      showBackButton: false,
      centerTitle: false,
      showFloatingIcon: true,
      body: AnimationSet.fadeIn(
        controller: _controller,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Citizen Reports',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(
                          FontAwesomeIcons.filter,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.spacingS),
                  ReportIssues(
                    reporterImage: 'assets/images/man02.jpg',
                    reportImage: 'assets/images/road01.jpeg',
                    reporterName: 'Nwaka O',
                    reporterLocation: 'Aba North',
                    reportCategory: 'feedback',
                    reportCaption:
                        "Security has improved in my area, but we still need more street lights. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. ",
                    reportUpvotes: '40',
                    reportDownvotes: '2',
                    reportShares: '18',
                    useReportImage: true,
                    useReporterImage: true,
                  ),
                  ReportIssues(
                    reporterName: 'LP Chukwuka',
                    reporterLocation: 'Ikwuano',
                    reportCategory: 'Enquiry',
                    reportCaption:
                        'Health center in Ikwuano is understaffed and lacks basic medication.',
                    reportUpvotes: '3',
                    reportDownvotes: '0',
                    reportShares: '1',
                    useReportImage: false,
                    useReporterImage: false,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
