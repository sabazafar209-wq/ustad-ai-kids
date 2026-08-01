import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ustad_ai_kids/core/navigation/navigation_helper.dart';
import 'package:ustad_ai_kids/core/navigation/standard_app_bar.dart';

import '../../domain/models/child_profile.dart';
import '../providers/child_provider.dart';
import '../widgets/age_dropdown.dart';
import '../widgets/avatar_selector.dart';
import '../widgets/grade_dropdown.dart';
import '../widgets/interests_selector.dart';

class CreateChildPage extends ConsumerStatefulWidget {
  const CreateChildPage({super.key});

  @override
  ConsumerState<CreateChildPage> createState() =>
      _CreateChildPageState();
}

class _CreateChildPageState extends ConsumerState<CreateChildPage> {
  final TextEditingController _nameController = TextEditingController();

  String avatar = "🐱";
  int? age;
  String? grade;
  List<String> interests = [];

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _saveChild() async {
    if (_nameController.text.trim().isEmpty ||
        age == null ||
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

    final child = ChildProfile(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text.trim(),
      avatar: avatar,
      age: age!,
      grade: grade!,
      interests: interests,
    );

    await ref.read(childProvider.notifier).saveChild(child);

    if (!mounted) return;

    NavigationHelper.replace(context, '/dashboard');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const StandardAppBar(
        title: 'Create Child',
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(
                labelText: "Child Name",
                hintText: "Enter your child's name",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.child_care),
              ),
            ),

            const SizedBox(height: 24),

            AvatarSelector(
              onAvatarSelected: (value) {
                setState(() {
                  avatar = value;
                });
              },
            ),

            const SizedBox(height: 30),

            AgeDropdown(
              selectedAge: age,
              onChanged: (value) {
                setState(() {
                  age = value;
                });
              },
            ),

            const SizedBox(height: 24),

            GradeDropdown(
              selectedGrade: grade,
              onChanged: (value) {
                setState(() {
                  grade = value;
                });
              },
            ),

            const SizedBox(height: 24),

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
                onPressed: _saveChild,
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