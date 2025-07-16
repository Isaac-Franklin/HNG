import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class Shares extends StatelessWidget {
  final String numberOfShares;
  const Shares({super.key, required this.numberOfShares});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        // color: AppColors.primary,
        borderRadius: BorderRadius.circular(50),
        color: Color.fromRGBO(170, 31, 45, 0.217),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 1),
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              numberOfShares,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          SizedBox(width: 5),
          // Text(
          //   'Down votes',
          //   style: TextStyle(fontSize: 12, color: AppColors.primary),
          // ),
          Icon(Icons.share_rounded, color: AppColors.primary, size: 15),
        ],
      ),
    );
  }
}
