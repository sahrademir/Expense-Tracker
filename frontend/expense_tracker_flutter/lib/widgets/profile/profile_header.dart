import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/core/colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),

        const CircleAvatar(
          radius: 55,
          backgroundColor: AppColors.text,
          child: Icon(
            Icons.person,
            color: Colors.white,
            size: 60,
          ),
        ),

        const SizedBox(height: 18),

        const Text(
          "Alex Swift",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.text,
          ),
        ),

        const SizedBox(height: 6),

        Text(
          "alexswift@email.com",
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 15,
          ),
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}