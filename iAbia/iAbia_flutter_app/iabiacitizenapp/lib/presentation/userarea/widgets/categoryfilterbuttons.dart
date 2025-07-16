import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class CategoryFilterButtonsSection extends StatelessWidget {
  final String categoryTitle;
  const CategoryFilterButtonsSection({super.key, required this.categoryTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(right: 5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0),
          // backgroundColor: Color.fromARGB(20, 0, 0, 0),
        ),
        onPressed: () {},
        child: Text(
          categoryTitle,
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
