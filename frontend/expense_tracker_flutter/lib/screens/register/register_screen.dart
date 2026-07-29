import 'package:flutter/material.dart';

import 'package:expense_tracker_flutter/core/colors.dart';

import 'package:expense_tracker_flutter/widgets/auth_card.dart';
import 'package:expense_tracker_flutter/widgets/auth_header.dart';
import 'package:expense_tracker_flutter/widgets/custom_text_field.dart';
import 'package:expense_tracker_flutter/widgets/primary_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: Stack(

        children: [

          const AuthHeader(),

          AuthCard(
            child: SingleChildScrollView(
              child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                const Text(
                  "SIGN UP",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: AppColors.text,
                  ),
                ),

                const SizedBox(height: 28),

                const CustomTextField(
                  hintText: "Email",
                ),

                const SizedBox(height: 16),

                const CustomTextField(
                  hintText: "Username",
                ),

                const SizedBox(height: 16),

                const CustomTextField(
                  hintText: "Password",
                  obscureText: true,
                ),

                const SizedBox(height: 22),

                Center(
                  child: GestureDetector(

                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        "/login",
                      );
                    },

                    child: const Text.rich(
                      TextSpan(
                        text: "Already have an account? ",
                        children: [
                          TextSpan(
                            text: "Sign In",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),

                PrimaryButton(
                  text: "SIGN UP",
                  onPressed: () {},
                ),
              ],
            ),
            ),
          ),
        ],
      ),
    );
  }
}