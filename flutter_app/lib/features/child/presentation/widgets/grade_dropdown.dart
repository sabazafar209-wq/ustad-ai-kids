import 'package:flutter/material.dart';

class GradeDropdown extends StatelessWidget {
  final String? selectedGrade;
  final ValueChanged<String?> onChanged;

  const GradeDropdown({
    super.key,
    required this.selectedGrade,
    required this.onChanged,
  });

  static const grades = [
    "Pre-School",
    "Kindergarten",
    "Grade 1",
    "Grade 2",
    "Grade 3",
    "Grade 4",
    "Grade 5",
    "Grade 6",
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: selectedGrade,
      decoration: const InputDecoration(
        labelText: "Grade",
        border: OutlineInputBorder(),
      ),
      items: grades
          .map(
            (grade) => DropdownMenuItem<String>(
              value: grade,
              child: Text(grade),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}