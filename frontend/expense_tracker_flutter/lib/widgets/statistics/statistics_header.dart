import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/core/colors.dart';

class StatisticsHeader extends StatelessWidget {
  const StatisticsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.fromLTRB(24, 24, 24, 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "MONTHLY REPORT",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}