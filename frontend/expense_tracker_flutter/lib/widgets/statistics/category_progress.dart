import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/core/colors.dart';
import 'progress_item.dart';

class CategoryProgress extends StatelessWidget {
  const CategoryProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "CATEGORY",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
            ),
          ),
          SizedBox(height: 18),

          ProgressItem(
            title: "Food",
            value: 0.60,
            color: Color(0xFF57D5E9),
          ),

          ProgressItem(
            title: "Transport",
            value: 0.36,
            color: Color(0xFF3F8CFF),
          ),

          ProgressItem(
            title: "Bills",
            value: 0.28,
            color: Color(0xFF1E3A8A),
          ),
        ],
      ),
    );
  }
}