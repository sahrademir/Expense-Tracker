import 'package:flutter/material.dart';

import '../../widgets/bottom_navbar.dart';

import 'widgets/balance_card.dart';
import 'widgets/dashboard_card.dart';
import 'widgets/summary_card.dart';
import 'widgets/transaction_tile.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: Stack(

        children: [

          const BalanceCard(),

          DashboardCard(

            child: Column(

              children: [

                Row(

                  children: const [

                    Expanded(

                      child: SummaryCard(
                        title: "INCOME",
                        amount: "\$18,621",
                      ),

                    ),

                    SizedBox(width: 16),

                    Expanded(

                      child: SummaryCard(
                        title: "EXPENSES",
                        amount: "\$5,945",
                      ),

                    ),

                  ],

                ),

                const SizedBox(height: 28),

                const Row(

                  mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                  children: [

                    Text(
                      "RECENT TRANSACTIONS",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Icon(Icons.keyboard_arrow_down),

                  ],

                ),

                const SizedBox(height: 12),

                Expanded(

                  child: ListView(

                    children: [

                      TransactionTile(
                        title: "Burger King",
                        amount: "10.8",
                        isIncome: false,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/edit-expense",
                          );
                        },
                      ),

                      TransactionTile(
                        title: "Uber",
                        amount: "7.2",
                        isIncome: false,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/edit-expense",
                          );
                        },
                      ),

                      TransactionTile(
                        title: "Salary",
                        amount: "1553",
                        isIncome: true,
                      ),

                      TransactionTile(
                        title: "Migros",
                        amount: "35.8",
                        isIncome: false,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/edit-expense",
                          );
                        },
                      ),

                      TransactionTile(
                        title: "Starbucks",
                        amount: "3.99",
                        isIncome: false,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/edit-expense",
                          );
                        },
                      ),

                    ],

                  ),

                ),

                const BottomNavBar(
                  currentIndex: 0,
                ),

              ],

            ),

          ),

        ],

      ),

    );

  }

}