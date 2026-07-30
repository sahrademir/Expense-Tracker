import 'package:flutter/material.dart';

import '../../widgets/bottom_navbar.dart';
import '../../widgets/expense_container.dart';
import '../../widgets/expense_form.dart';

class EditExpenseScreen extends StatelessWidget {
  const EditExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F2),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: ExpenseContainer(
              title: "Edit Expenses",
              child: ExpenseForm(
                isEdit: true,
                buttonText: "SAVE",

                onSave: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Expense Updated"),
                    ),
                  );

                  Navigator.pop(context);
                },

                onDelete: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Delete Expense"),
                      content: const Text(
                        "Are you sure you want to delete this expense?",
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Expense Deleted"),
                              ),
                            );

                            Navigator.pop(context);
                          },
                          child: const Text("Delete"),
                        ),
                      ],
                    ),
                  );
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