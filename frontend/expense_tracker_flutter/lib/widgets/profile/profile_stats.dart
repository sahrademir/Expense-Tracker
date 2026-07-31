import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/core/colors.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  Widget buildCard(
      String title,
      String value,
      IconData icon,
      ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 18,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              color: Colors.black12,
            )
          ],
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: AppColors.text,
            ),

            const SizedBox(height: 10),

            Text(
              value,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        buildCard(
          "Expenses",
          "128",
          Icons.payments,
        ),

        const SizedBox(width: 14),

        buildCard(
          "Categories",
          "8",
          Icons.category,
        ),

        const SizedBox(width: 14),

        buildCard(
          "Member",
          "2026",
          Icons.calendar_month,
        ),
      ],
    );
  }
}