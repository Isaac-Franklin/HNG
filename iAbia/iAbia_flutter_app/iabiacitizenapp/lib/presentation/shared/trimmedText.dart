// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/theme/app_colors.dart';

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLength;

  const ExpandableText({
    super.key,
    required this.text,
    this.trimLength = 100, // number of chars to show initially
  });

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final text = widget.text;
    final trimLength = widget.trimLength;

    final displayText =
        isExpanded || text.length <= trimLength
            ? text
            : '${text.substring(0, trimLength)}...';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          // vsync: this,
          child: Text(
            displayText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        if (text.length > trimLength)
          GestureDetector(
            onTap: () => setState(() => isExpanded = !isExpanded),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  isExpanded ? 'View Less' : 'View More',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
