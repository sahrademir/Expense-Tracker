import 'package:flutter/material.dart';

class AuthCard extends StatelessWidget {

  final Widget child;

  const AuthCard({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {

    return Align(
      alignment: Alignment.bottomCenter,

      child: Container(
        width: double.infinity,

        padding: const EdgeInsets.symmetric(
          horizontal: 32,
          vertical: 36,
        ),

        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(24),
          ),
        ),

        child: child,
      ),
    );
  }
}