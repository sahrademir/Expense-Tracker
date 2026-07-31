import 'package:flutter/material.dart';

import '../custom_text_field.dart';
import '../primary_button.dart';

class ProfileForm extends StatelessWidget {
  const ProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(
          hintText: "Full Name",
        ),

        const SizedBox(height: 18),

        const CustomTextField(
          hintText: "Email",
        ),

        const SizedBox(height: 18),

        const CustomTextField(
          hintText: "Username",
        ),

        const SizedBox(height: 30),

        PrimaryButton(
          text: "SAVE",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}