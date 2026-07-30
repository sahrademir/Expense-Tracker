import 'package:flutter/material.dart';

import '../core/colors.dart';

class CategoryDropdown extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String>? onChanged;

  const CategoryDropdown({
    super.key,
    this.initialValue,
    this.onChanged,
  });

  @override
  State<CategoryDropdown> createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CategoryDropdown> {
  late String selectedCategory;

  final List<String> categories = [
    "Food",
    "Transport",
    "Shopping",
    "Health",
    "Bills",
    "Entertainment",
    "Other",
  ];

  @override
  void initState() {
    super.initState();
    selectedCategory = widget.initialValue ?? categories.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE5E5E5),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedCategory,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.text,
          ),
          items: categories.map((category) {
            return DropdownMenuItem(
              value: category,
              child: Text(category),
            );
          }).toList(),
          onChanged: (value) {
            setState(() {
              selectedCategory = value!;
            });

            widget.onChanged?.call(value!);
          },
        ),
      ),
    );
  }
}