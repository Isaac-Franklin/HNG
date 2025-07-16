import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/core/utils/device_utils.dart';
import 'package:iabiacitizenapp/presentation/shared/trimmedText.dart';
import 'package:iabiacitizenapp/presentation/userarea/widgets/downvotetemplate.dart';
import 'package:iabiacitizenapp/presentation/userarea/widgets/responderIDandKind.dart';
import 'package:iabiacitizenapp/presentation/userarea/widgets/sharetemplate.dart';
import 'package:iabiacitizenapp/presentation/userarea/widgets/upvotetemplate.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class TrendingIssues extends StatelessWidget {
  const TrendingIssues({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(),
      child: Column(
        children: [
          // response proper
          Container(
            width: DeviceUtils.screenWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 240, 240, 240),
              // boxShadow: [
              //   BoxShadow(
              //     color: Color.fromARGB(20, 0, 0, 0),
              //     spreadRadius: 2, // How much the shadow spreads
              //     blurRadius: 5, // Softness of the shadow
              //     offset: Offset(0, 3), // Horizontal and vertical offset
              //   ),
              // ],
            ),
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                RespondedIDandKind(
                  useActivityLogic: false,
                  responder: 'Elizabeth Chijioke',
                  responderTitle:
                      'Special adviser to Governer on digital economy',
                  responseType: 'Complaint',
                  responderImage: Image(
                    fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                    image: AssetImage('assets/images/bethy.jpeg'),
                  ),
                ),
                SizedBox(height: AppSizes.spacingS),

                // message responded to
                Container(
                  width: DeviceUtils.screenWidth,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 218, 218, 218),
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
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image(
                                  fit: BoxFit.cover,
                                  width: 30,
                                  height: 30,
                                  image: AssetImage('assets/images/man01.jpg'),
                                ),
                              ),
                              SizedBox(width: AppSizes.spacingS),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      'Chima Okechukwu ',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodySmall?.copyWith(
                                        fontWeight: FontWeight.bold,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'from Osisioma',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10,
                                      color: AppColors.primary,
                                      decorationColor: AppColors.primary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: AppSizes.spacingS),
                          Text(
                            'raised a complaint',
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
                      SizedBox(height: AppSizes.spacingS),

                      // citizen submission
                      ExpandableText(
                        text:
                            "It has been over two weeks now without any electricity supply in my neighborhood in Umuahia North. This power outage is affecting businesses and households, making daily activities very difficult. Despite multiple complaints to the power company, there has been no resolution or communication",
                        trimLength: 100,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: AppSizes.spacingS),
                // actual response
                ExpandableText(
                  text:
                      'Hello Chima, we are well aware of this and apologise for the inconviniece this has cause, we have commences processes to fix this and you should see a difference in a few days',
                  trimLength: 100,
                ),
                SizedBox(height: AppSizes.spacingS),

                // react to response
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Upvotes(numberOfUpvotes: '20'),
                          SizedBox(width: 5),
                          DownVotes(numberOfDownVotes: '5'),
                        ],
                      ),

                      // share
                      Shares(numberOfShares: '15'),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: AppSizes.spacingXL),
        ],
      ),
    );
  }
}
