import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'screens/welcome/welcome_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/register/register_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/add_expense/add_expense_screen.dart';
import 'screens/edit_expense/edit_expense_screen.dart';
import 'package:expense_tracker_flutter/screens/statistics_screen.dart';
import 'package:expense_tracker_flutter/screens/profile_screen.dart';
import 'package:expense_tracker_flutter/screens/edit_profile_screen.dart';
import 'package:expense_tracker_flutter/screens/change_password_screen.dart';
import 'package:expense_tracker_flutter/screens/about_screen.dart';



void main() {
  runApp(const ExpenseTrackerApp());
}

class ExpenseTrackerApp extends StatelessWidget {
  const ExpenseTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomeScreen(),
        "/login": (context) => LoginScreen(),
        "/register": (context) => RegisterScreen(),
        "/dashboard": (context) => const DashboardScreen(),
        "/add-expense": (context) => const AddExpenseScreen(),
        "/edit-expense": (context) => const EditExpenseScreen(),
        '/statistics': (context) => const StatisticsScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/change-password': (context) => const ChangePasswordScreen(),
        '/about': (context) => const AboutScreen(),
      },
    );
  }
}