import 'package:flutter/material.dart';
import '../../../core/colors.dart';
import '../../../core/gradients.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .42,

      padding: const EdgeInsets.fromLTRB(24, 24, 24, 60),

      decoration: const BoxDecoration(
        gradient: AppGradients.primary,
      ),

      child: Column(
        children: [

          Row(
            children: [

              const CircleAvatar(
                radius: 18,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person_outline,
                  color: AppColors.text,
                ),
              ),

              const SizedBox(width: 12),

              const Text(
                "Hi, Alex!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),

              const Spacer(),

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const Spacer(),

          const Text(
            "CURRENT BALANCE",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 13,
              letterSpacing: 1,
            ),
          ),

          const SizedBox(height: 14),

          const Text(
            "\$ 33,576",
            style: TextStyle(
              color: Colors.white,
              fontSize: 42,
              fontWeight: FontWeight.bold,
            ),
          ),

          const Spacer(),
        ],
      ),
    );
  }
}