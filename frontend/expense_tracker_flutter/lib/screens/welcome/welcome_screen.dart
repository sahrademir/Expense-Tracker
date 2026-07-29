import 'package:flutter/material.dart';
import 'package:expense_tracker_flutter/widgets/auth_card.dart';
import 'package:expense_tracker_flutter/widgets/auth_header.dart';

import 'widgets/welcome_content.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(

      body: Stack(

        children: [

          AuthHeader(),

          AuthCard(
            child: WelcomeContent(),
          ),

        ],
      ),
    );
  }
}