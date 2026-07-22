import 'package:flutter/material.dart';

import '../widgets/hero_section.dart';
import '../widgets/tagline.dart';
import '../widgets/welcome_buttons.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 32,
            ),
            child: Column(
              children: const [
                HeroSection(),
                SizedBox(height: 40),
                Tagline(),
                SizedBox(height: 50),
                WelcomeButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}