import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/core/utils/device_utils.dart';
import 'package:iabiacitizenapp/presentation/shared/custom_app_bar.dart';
import 'package:iabiacitizenapp/presentation/userarea/widgets/govactivity.dart';

class CommunityArea extends StatelessWidget {
  const CommunityArea({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: Image(
        width: 100,
        image: AssetImage('assets/images/iabialogonobg.png'),
      ),

      showBackButton: false,
      centerTitle: false,
      body: SingleChildScrollView(
        child: Container(
          width: DeviceUtils.screenWidth,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GovActivityReport(
                reportCaption:
                    "Abia State government launches programme to transform education within the state: Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ",
                reportUpvotes: '45',
                reportDownvotes: '2',
                reportShares: '70',
                useReportImage: true,
                reportImage: 'assets/images/govact2.jpeg',
              ),
              GovActivityReport(
                reportCaption:
                    'Abia State government launches programme to transform education within the state',
                reportUpvotes: '45',
                reportDownvotes: '2',
                reportShares: '70',
                useReportImage: true,
                reportImage: 'assets/images/govact.jpg',
              ),
              GovActivityReport(
                reportCaption:
                    'Abia State government launches programme to transform education within the state',
                reportUpvotes: '45',
                reportDownvotes: '2',
                reportShares: '70',
                useReportImage: true,
                reportImage: 'assets/images/govact2.jpeg',
              ),
              GovActivityReport(
                reportCaption:
                    'Abia State government organizes a two dat retreat for stakeholders',
                reportUpvotes: '45',
                reportDownvotes: '2',
                reportShares: '70',
                useReportImage: true,
                reportImage: 'assets/images/govact3.jpeg',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
