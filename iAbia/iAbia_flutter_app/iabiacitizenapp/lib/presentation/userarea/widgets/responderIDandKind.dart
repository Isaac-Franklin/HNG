import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/core/utils/device_utils.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class RespondedIDandKind extends StatelessWidget {
  final String responder;
  final String responderTitle;
  final String responseType;
  final Image responderImage;
  final bool useActivityLogic;
  const RespondedIDandKind({
    super.key,
    required this.responder,
    required this.responderTitle,
    required this.responseType,
    required this.responderImage,
    this.useActivityLogic = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: responderImage,
              ),
              SizedBox(width: AppSizes.spacingS),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: DeviceUtils.screenWidth * 0.6,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          responder,
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 2),
                        // verified tick
                        Icon(
                          Icons.verified,
                          color: AppColors.darkPrimary,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: DeviceUtils.screenWidth * 0.6,
                    child: Text(
                      responderTitle,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontSize: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(width: AppSizes.spacingS),

          // responded text
          if (useActivityLogic)
            RichText(
              text: TextSpan(
                text: 'responded to this ', // first part
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(fontSize: 11),
                children: <TextSpan>[
                  // TextSpan(
                  //   text: responseType,
                  //   style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  //     fontWeight: FontWeight.bold,
                  //     color: AppColors.primary,
                  //     fontSize: 13,
                  //     decorationColor: AppColors.primary,
                  //     decoration: TextDecoration.underline,
                  //   ),
                  // ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
