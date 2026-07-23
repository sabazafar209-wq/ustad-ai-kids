import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/register_form.dart';
import '../widgets/register_header.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [

              const SizedBox(height: 20),

              const RegisterHeader(),

              const SizedBox(height: 40),

              const RegisterForm(),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const Text("Already have an account?"),

                  TextButton(
                    onPressed: () {
                      context.go('/login');
                    },
                    child: const Text("Login"),
                  ),

                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}