import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/core/colors.dart';
import 'auth_buttons.dart';

class WelcomeContent extends StatelessWidget {
  const WelcomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          "Best way to save\n your money",
          style: TextStyle(
            fontSize: 24,
            height: 1.1,
            fontWeight: FontWeight.w600,
            color: AppColors.text,
          ),
        ),

        SizedBox(height: 48),

        AuthButtons(),
      ],
    );
  }
}