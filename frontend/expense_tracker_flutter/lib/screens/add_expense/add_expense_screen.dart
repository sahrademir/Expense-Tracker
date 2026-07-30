import 'package:flutter/material.dart';

import '../../widgets/bottom_navbar.dart';
import '../../widgets/expense_container.dart';
import '../../widgets/expense_form.dart';

class AddExpenseScreen extends StatelessWidget {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ExpenseContainer(
              title: "Add Expenses",
              child: ExpenseForm(
                buttonText: "ADD",
                onSave: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Expense Added"),
                    ),
                  );

                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavBar(
        currentIndex: 1,
      ),
    );
  }
}