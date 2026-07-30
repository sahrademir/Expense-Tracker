import 'package:flutter/material.dart';

class DashboardCard extends StatelessWidget {
  final Widget child;

  const DashboardCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .68,

        padding: const EdgeInsets.fromLTRB(
          24,
          28,
          24,
          16,
        ),

        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(26),
          ),
        ),

        child: child,
      ),
    );
  }
}