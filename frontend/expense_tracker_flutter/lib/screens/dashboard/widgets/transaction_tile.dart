import 'package:flutter/material.dart';
import '../../../core/colors.dart';

class TransactionTile extends StatelessWidget {
  final String title;
  final String amount;
  final bool isIncome;
  final VoidCallback? onTap;

  const TransactionTile({
    super.key,
    required this.title,
    required this.amount,
    required this.isIncome,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: AppColors.text,
                ),
              ),
            ),

            Text(
              "${isIncome ? "+" : "-"} \$ $amount",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: isIncome
                    ? Colors.green
                    : AppColors.text,
              ),
            ),

            const SizedBox(width: 8),

            const Icon(
              Icons.chevron_right,
              size: 20,
            ),

          ],
        ),
      ),
    );
  }
}