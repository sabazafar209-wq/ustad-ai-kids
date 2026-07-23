import 'package:flutter/material.dart';

import '../../../../shared/widgets/buttons/primary_button.dart';
import '../../../../shared/widgets/forms/custom_text_field.dart';
import '../../../../shared/widgets/forms/password_text_field.dart';

import 'country_dropdown.dart';
import 'language_dropdown.dart';
import 'terms_checkbox.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  String? country;
  String? language;

  bool agree = false;

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void register() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (!agree) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please accept the Terms & Conditions"),
        ),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Registration Coming Soon"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [

          CustomTextField(
            label: "Full Name",
            controller: nameController,
            prefixIcon: Icons.person,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter your name";
              }
              return null;
            },
          ),

          const SizedBox(height: 20),

          CustomTextField(
            label: "Email",
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Enter email";
              }
              return null;
            },
          ),

          const SizedBox(height: 20),

          PasswordTextField(
            label: "Password",
            controller: passwordController,
          ),

          const SizedBox(height: 20),

          PasswordTextField(
            label: "Confirm Password",
            controller: confirmPasswordController,
          ),

          const SizedBox(height: 20),

          CountryDropdown(
            value: country,
            onChanged: (value) {
              setState(() {
                country = value;
              });
            },
          ),

          const SizedBox(height: 20),

          LanguageDropdown(
            value: language,
            onChanged: (value) {
              setState(() {
                language = value;
              });
            },
          ),

          const SizedBox(height: 12),

          TermsCheckbox(
            value: agree,
            onChanged: (value) {
              setState(() {
                agree = value ?? false;
              });
            },
          ),

          const SizedBox(height: 30),

          PrimaryButton(
            text: "Create Account",
            onPressed: register,
          ),

        ],
      ),
    );
  }
}