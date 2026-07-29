import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/core/gradients.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppGradients.primary,
      ),
      child: SafeArea(
        child: Align(
          alignment: const Alignment(0, -0.35),
          child: Image.asset(
            "assets/images/logo.png",
            width: 220,
          ),
        ),
      ),
    );
  }
}