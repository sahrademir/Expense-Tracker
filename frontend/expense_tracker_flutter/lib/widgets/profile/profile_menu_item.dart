import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/core/colors.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      margin: const EdgeInsets.only(bottom: 14),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.text,
        ),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios,size:16),
        onTap: onTap,
      ),
    );
  }
}