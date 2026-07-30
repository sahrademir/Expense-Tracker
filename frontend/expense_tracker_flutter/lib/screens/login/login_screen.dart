import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/core/colors.dart';

import 'package:expense_tracker_flutter/widgets/auth_card.dart';
import 'package:expense_tracker_flutter/widgets/auth_header.dart';
import 'package:expense_tracker_flutter/widgets/custom_text_field.dart';
import 'package:expense_tracker_flutter/widgets/primary_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          const AuthHeader(),

          SafeArea(
            child: Column(
              children: [
                const Spacer(),

                AuthCard(
                  heightFactor: 0.46,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "SIGN IN",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: AppColors.text,
                        ),
                      ),

                      const SizedBox(height: 24),

                      const CustomTextField(
                        hintText: "Username",
                      ),

                      const SizedBox(height: 12),

                      const CustomTextField(
                        hintText: "Password",
                        obscureText: true,
                      ),

                      const SizedBox(height: 18),

                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              "/register",
                            );
                          },
                          child: const Text.rich(
                            TextSpan(
                              text: "Don't have an account? ",
                              children: [
                                TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 18),

                      PrimaryButton(
                        text: "SIGN IN",
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                            context,
                            "/dashboard",
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}