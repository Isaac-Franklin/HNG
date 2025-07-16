import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class Upvotes extends StatelessWidget {
  final String numberOfUpvotes;
  const Upvotes({super.key, required this.numberOfUpvotes});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Color.fromRGBO(170, 31, 45, 0.217),
        borderRadius: BorderRadius.circular(50),
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
              numberOfUpvotes,
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),
          SizedBox(width: 5),
          // Text(
          //   'Up votes',
          //   style: TextStyle(fontSize: 12, color: AppColors.primary),
          // ),
          Icon(Icons.keyboard_arrow_up, color: AppColors.primary, size: 15),
        ],
      ),
    );
  }
}
