import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/widgets/primary_button.dart';

class AuthButtons extends StatelessWidget {
  const AuthButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PrimaryButton(
          text: "SIGN UP",
          onPressed: () {
            Navigator.pushNamed(context, "/register");
          },
        ),

        const SizedBox(height: 20),

        PrimaryButton(
          text: "SIGN IN",
          onPressed: () {
            Navigator.pushNamed(context, "/login");
          },
        ),
      ],
    );
  }
}