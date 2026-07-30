import 'package:flutter/material.dart';

class ExpenseForm extends StatefulWidget {
  final String buttonText;
  final bool isEdit;
  final VoidCallback? onSave;
  final VoidCallback? onDelete;

  const ExpenseForm({
    super.key,
    required this.buttonText,
    this.isEdit = false,
    this.onSave,
    this.onDelete,
  });

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  final _noteController = TextEditingController();

  String? selectedCategory;

  final List<String> categories = [
    "Food",
    "Transport",
    "Shopping",
    "Bills",
    "Entertainment",
    "Health",
    "Education",
    "Other",
  ];

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: const TextStyle(
        color: Color(0xFF7C7C7C),
        fontSize: 13,
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 14,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(
          color: Color(0xFF2F5DB8),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        /// TITLE
        TextField(
          controller: _titleController,
          decoration: inputDecoration("TITLE"),
        ),

        const SizedBox(height: 16),

        /// AMOUNT
        TextField(
          controller: _amountController,
          keyboardType: TextInputType.number,
          decoration: inputDecoration("AMOUNT"),
        ),

        const SizedBox(height: 16),

        /// CATEGORY
        DropdownButtonFormField<String>(
          value: selectedCategory,
          decoration: inputDecoration("CATEGORY"),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: categories
              .map(
                (category) => DropdownMenuItem(
                  value: category,
                  child: Text(category),
                ),
              )
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedCategory = value;
            });
          },
        ),

        const SizedBox(height: 16),

        /// NOTE
        TextField(
          controller: _noteController,
          maxLines: 1,
          decoration: inputDecoration("NOTE"),
        ),

        const SizedBox(height: 24),

        if (widget.isEdit)
          GestureDetector(
            onTap: widget.onDelete,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 16,
                ),
                SizedBox(width: 6),
                Text(
                  "DELETE EXPENSE",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

        if (widget.isEdit)
          const SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: widget.onSave,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2F5DB8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 0,
            ),
            child: Text(
              widget.buttonText,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}