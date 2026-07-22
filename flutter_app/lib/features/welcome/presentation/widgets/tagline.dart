import 'package:flutter/material.dart';

class Tagline extends StatelessWidget {
  const Tagline({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Every child learns differently.\nOur AI creates a personalized learning journey based on age, interests, and progress.",
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge,
    );
  }
}