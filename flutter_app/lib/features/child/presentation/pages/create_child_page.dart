import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widgets/avatar_selector.dart';
import '../widgets/age_dropdown.dart';
import '../widgets/grade_dropdown.dart';
import '../widgets/interests_selector.dart';

class CreateChildPage extends StatefulWidget {
  const CreateChildPage({super.key});

  @override
  State<CreateChildPage> createState() => _CreateChildPageState();
}

class _CreateChildPageState extends State<CreateChildPage> {
  String avatar = "🐱";
  int? age;
  String? grade;
  List<String> interests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Child"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Avatar
            AvatarSelector(
              onAvatarSelected: (value) {
                setState(() {
                  avatar = value;
                });
              },
            ),

            const SizedBox(height: 30),

            /// Age
            AgeDropdown(
              selectedAge: age,
              onChanged: (value) {
                setState(() {
                  age = value;
                });
              },
            ),

            const SizedBox(height: 24),

            /// Grade
            GradeDropdown(
              selectedGrade: grade,
              onChanged: (value) {
                setState(() {
                  grade = value;
                });
              },
            ),

            const SizedBox(height: 24),

            /// Interests
            InterestsSelector(
              onSelectionChanged: (value) {
                setState(() {
                  interests = value;
                });
              },
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Validation
                  if (age == null ||
                      grade == null ||
                      interests.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          "Please complete all child information.",
                        ),
                      ),
                    );
                    return;
                  }

                  debugPrint("========== CHILD PROFILE ==========");
                  debugPrint("Avatar: $avatar");
                  debugPrint("Age: $age");
                  debugPrint("Grade: $grade");
                  debugPrint("Interests: $interests");
                  debugPrint("===================================");

                  context.go("/dashboard");
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}