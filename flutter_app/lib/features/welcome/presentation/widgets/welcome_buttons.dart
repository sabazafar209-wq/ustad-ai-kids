import 'package:flutter/material.dart';

class WelcomeButtons extends StatelessWidget {
  const WelcomeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // TODO: Navigate to Register
            },
            child: const Text("Get Started"),
          ),
        ),

        const SizedBox(height: 16),

        TextButton(
          onPressed: () {
            // TODO: Navigate to Login
          },
          child: const Text("I already have an account"),
        ),
      ],
    );
  }
}