import 'package:flutter/material.dart';
import '../core/colors.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      height: 65,
      backgroundColor: Colors.white,
      selectedIndex: currentIndex,
      indicatorColor: Colors.transparent,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,

      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, "/dashboard");
            break;

          case 1:
            Navigator.pushReplacementNamed(context, "/add-expense");
            break;

          case 2:
            Navigator.pushReplacementNamed(context, "/dashboard");
            break;

          case 3:
            Navigator.pushReplacementNamed(context, "/dashboard");
            break;
        }
      },

      destinations: const [

        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: "",
        ),

        NavigationDestination(
          icon: Icon(Icons.add_circle_outline),
          selectedIcon: Icon(Icons.add_circle),
          label: "",
        ),

        NavigationDestination(
          icon: Icon(Icons.show_chart_outlined),
          selectedIcon: Icon(Icons.show_chart),
          label: "",
        ),

        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: "",
        ),
      ],
    );
  }
}