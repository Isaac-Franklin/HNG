import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class DownVotes extends StatelessWidget {
  final String numberOfDownVotes;
  const DownVotes({super.key, required this.numberOfDownVotes});

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
              numberOfDownVotes,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          SizedBox(width: 5),
          // Text(
          //   'Down votes',
          //   style: TextStyle(fontSize: 12, color: AppColors.primary),
          // ),
          Icon(Icons.keyboard_arrow_down, color: AppColors.primary, size: 15),
        ],
      ),
    );
  }
}
