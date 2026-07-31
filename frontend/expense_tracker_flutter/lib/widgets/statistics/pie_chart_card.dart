import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:expense_tracker_flutter/core/colors.dart';

class ChartItem {
  final String label;
  final double amount;
  final Color color;

  const ChartItem({
    required this.label,
    required this.amount,
    required this.color,
  });
}

class PieChartCard extends StatelessWidget {
  final String title;
  final List<ChartItem> sections;

  const PieChartCard({
    super.key,
    required this.title,
    required this.sections,
  });

  double get total =>
      sections.fold(0, (sum, item) => sum + item.amount);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.text,
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              height: 190,
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 45,
                  sectionsSpace: 3,
                  borderData: FlBorderData(show: false),
                  sections: sections
                      .map(
                        (item) => PieChartSectionData(
                          color: item.color,
                          value: item.amount,
                          title:
                              "${((item.amount / total) * 100).toStringAsFixed(0)}%",
                          radius: 65,
                          titleStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Wrap(
              spacing: 16,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: sections.map((item) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 6,
                      backgroundColor: item.color,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      item.label,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}