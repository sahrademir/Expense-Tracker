import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/core/colors.dart';
import 'package:expense_tracker_flutter/core/gradients.dart';

class PrimaryButton extends StatelessWidget {
    final String text;
    final VoidCallback onPressed;

    const PrimaryButton({
        super.key,
        required this.text,
        required this.onPressed,
    });

    @override
    Widget build(BuildContext context){
        return Material(
            color: Colors.transparent,
            child: InkWell(
                onTap: onPressed,
                borderRadius: BorderRadius.circular(8),
                child: Ink(
                    decoration: BoxDecoration(
                        gradient: AppGradients.primary,
                        borderRadius: BorderRadius.circular(8),
                    ),
                    child: SizedBox(
                        height: 50,
                        child: Center(
                            child: Text(
                                text,
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0,
                                ),
                            ),
                        ),
                    ),
                ),
            ),
        );
    }
}  