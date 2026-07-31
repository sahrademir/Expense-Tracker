import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/core/colors.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: AppBar(
        title: const Text("About"),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: AppColors.text,
      ),

      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [

                Icon(
                  Icons.account_balance_wallet,
                  size: 70,
                  color: AppColors.text,
                ),

                SizedBox(height: 20),

                Text(
                  "Expense Tracker",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.text,
                  ),
                ),

                SizedBox(height: 10),

                Text("Version 1.0"),

                SizedBox(height: 30),

                Divider(),

                SizedBox(height: 20),

                Text(
                  "Built with",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text("Flutter"),
                Text("FastAPI"),
                Text("SQLite"),

                SizedBox(height: 30),

                Divider(),

                SizedBox(height: 20),

                Text(
                  "Developer",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 10),

                Text("Sahra Demir"),

                SizedBox(height: 20),

                Text(
                  "© 2026",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}