import 'package:flutter/material.dart';

class RegisterHeader extends StatelessWidget {
  const RegisterHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [

        const Icon(
          Icons.school_rounded,
          size: 72,
          color: Colors.blue,
        ),

        const SizedBox(height: 24),

        Text(
          "Create Parent Account",
          style: theme.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),

        const SizedBox(height: 12),

        Text(
          "Welcome to Ustad AI Kids.\nLet's begin your child's AI learning journey.",
          style: theme.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),

      ],
    );
  }
}