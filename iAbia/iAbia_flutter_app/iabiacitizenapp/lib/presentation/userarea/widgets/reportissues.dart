import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/core/utils/device_utils.dart';
import 'package:iabiacitizenapp/presentation/shared/trimmedText.dart';
import 'package:iabiacitizenapp/presentation/userarea/widgets/downvotetemplate.dart';
import 'package:iabiacitizenapp/presentation/userarea/widgets/sharetemplate.dart';
import 'package:iabiacitizenapp/presentation/userarea/widgets/upvotetemplate.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class ReportIssues extends StatelessWidget {
  final String reporterName;
  final String reporterLocation;
  final String reportCategory;
  final String reportCaption;
  final String reportUpvotes;
  final String reportDownvotes;
  final String reportShares;
  final String? reportImage;
  final String? reporterImage;
  final bool useReporterImage;
  final bool useReportImage;

  const ReportIssues({
    super.key,
    required this.reporterName,
    required this.reporterLocation,
    required this.reportCategory,
    required this.reportCaption,
    required this.reportUpvotes,
    required this.reportDownvotes,
    required this.reportShares,
    this.reportImage,
    required this.useReportImage,
    this.reporterImage,
    required this.useReporterImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(width: 1, color: Color.fromRGBO(170, 31, 45, 0.217)),
      ),
      child:
      // response proper
      Column(
        children: [
          // user report
          Container(
            width: DeviceUtils.screenWidth,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // boxShadow: [
              //   BoxShadow(
              //     color: Color.fromARGB(20, 0, 0, 0),
              //     spreadRadius: 2,
              //     blurRadius: 5,
              //     offset: Offset(0, 3),
              //   ),
              // ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        useReporterImage
                            ? ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                fit: BoxFit.cover,
                                width: 40,
                                height: 40,
                                image: AssetImage(reporterImage!),
                              ),
                            )
                            : ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image(
                                fit: BoxFit.cover,
                                width: 40,
                                height: 40,
                                image: AssetImage('assets/images/man02.jpg'),
                              ),
                            ),
                        SizedBox(width: AppSizes.spacingS),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 70,
                              child: Text(
                                reporterName,
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 70,
                              child: Text(
                                'from $reporterLocation',
                                style: Theme.of(
                                  context,
                                ).textTheme.bodySmall?.copyWith(
                                  fontWeight: FontWeight.w400,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 10,
                                  color: AppColors.primary,
                                  decorationColor: AppColors.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      'gave a $reportCategory',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                        decorationColor: AppColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
                useReportImage
                    ?
                    // Image(s)
                    Column(
                      children: [
                        SizedBox(height: AppSizes.spacingS),
                        Container(
                          height: 300,
                          width: DeviceUtils.screenWidth,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage(reportImage!),
                            ),
                          ),
                        ),
                      ],
                    )
                    : SizedBox(height: AppSizes.spacingS),

                // citizen submission
                ExpandableText(text: reportCaption, trimLength: 100),
              ],
            ),
          ),

          SizedBox(height: AppSizes.spacingS),
          // reaction to report
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Upvotes(numberOfUpvotes: reportUpvotes),
                    SizedBox(width: 5),
                    DownVotes(numberOfDownVotes: reportDownvotes),
                  ],
                ),

                // share
                Shares(numberOfShares: reportShares),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
