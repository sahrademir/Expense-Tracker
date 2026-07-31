import 'package:flutter/material.dart';

import '../custom_text_field.dart';
import '../primary_button.dart';

class ChangePasswordForm extends StatelessWidget {
  const ChangePasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(
          hintText: "Current Password",
          obscureText: true,
        ),

        const SizedBox(height: 18),

        const CustomTextField(
          hintText: "New Password",
          obscureText: true,
        ),

        const SizedBox(height: 18),

        const CustomTextField(
          hintText: "Confirm Password",
          obscureText: true,
        ),

        const SizedBox(height: 30),

        PrimaryButton(
          text: "CHANGE PASSWORD",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}