import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/core/colors.dart';

import 'package:expense_tracker_flutter/widgets/statistics/statistics_header.dart';
import 'package:expense_tracker_flutter/widgets/statistics/pie_chart_card.dart';
import 'package:expense_tracker_flutter/widgets/statistics/category_progress.dart';

import 'package:expense_tracker_flutter/widgets/bottom_navbar.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const StatisticsHeader(),

              PieChartCard(
                title: "EXPENSES",
                sections: const [
                  ChartItem(
                    label: "Food",
                    amount: 520,
                    color: Color(0xFF57D5E9),
                  ),
                  ChartItem(
                    label: "Transport",
                    amount: 260,
                    color: Color(0xFF4F8DFD),
                  ),
                  ChartItem(
                    label: "Bills",
                    amount: 170,
                    color: Color(0xFF1C3FAA),
                  ),
                ],
              ),

              const CategoryProgress(),

              const SizedBox(height: 24),

              PieChartCard(
                title: "INCOME",
                sections: const [
                  ChartItem(
                    label: "Salary",
                    amount: 3500,
                    color: Color(0xFF57D5E9),
                  ),
                  ChartItem(
                    label: "Freelance",
                    amount: 1200,
                    color: Color(0xFF4F8DFD),
                  ),
                  ChartItem(
                    label: "Investment",
                    amount: 600,
                    color: Color(0xFF1C3FAA),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const BottomNavBar(
        currentIndex: 2,
      ),
    );
  }
}