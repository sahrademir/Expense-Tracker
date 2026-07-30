import 'package:flutter/material.dart';

class ExpenseContainer extends StatelessWidget {
  final String title;
  final Widget child;

  const ExpenseContainer({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFE3E3E3),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF0D2A63),
              fontWeight: FontWeight.w700,
              fontSize: 18,
              letterSpacing: 0.8,
            ),
          ),
          const SizedBox(height: 28),
          child,
        ],
      ),
    );
  }
}