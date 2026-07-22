import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SafeArea(

        child: Padding(

          padding: const EdgeInsets.all(24),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            crossAxisAlignment: CrossAxisAlignment.center,

            children: [

              const Spacer(),

              const Icon(
                Icons.school,
                size: 100,
              ),

              const SizedBox(height: 30),

              Text(
                "Welcome to\nUstad AI Kids",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium,
              ),

              const SizedBox(height: 20),

              const Text(
                "Every child deserves a personalized learning experience powered by AI.",
                textAlign: TextAlign.center,
              ),

              const Spacer(),

              SizedBox(

                width: double.infinity,

                child: FilledButton(

                  onPressed: () {},

                  child: const Padding(
                    padding: EdgeInsets.all(16),
                    child: Text("Get Started"),
                  ),

                ),

              ),

              const SizedBox(height: 12),

            ],

          ),

        ),

      ),

    );

  }

}