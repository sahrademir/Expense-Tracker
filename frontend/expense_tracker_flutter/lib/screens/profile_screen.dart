import 'package:flutter/material.dart';

import 'package:expense_tracker_flutter/widgets/profile/profile_header.dart';
import 'package:expense_tracker_flutter/widgets/profile/profile_stats.dart';
import 'package:expense_tracker_flutter/widgets/profile/profile_menu_item.dart';
import 'package:expense_tracker_flutter/widgets/bottom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: const Color(0xffF5F7FB),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            children: [

              const ProfileHeader(),

              const ProfileStats(),

              const SizedBox(height: 30),

              ProfileMenuItem(
                icon: Icons.edit,
                title: "Edit Profile",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/edit-profile",
                  )
                },
              ),

              ProfileMenuItem(
                icon: Icons.lock_outline,
                title: "Change Password",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/change-password",
                  )
                },
              ),

              ProfileMenuItem(
                icon: Icons.info_outline,
                title: "About",
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/about",
                  )
                },
              ),

              ProfileMenuItem(
                icon: Icons.logout,
                title: "Logout",
                onTap: () {
                  Navigator.pushReplacementNamed(
                    context,
                    "/login",
                  );
                },
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: const BottomNavBar(
        currentIndex: 3,
      ),
    );
  }
}