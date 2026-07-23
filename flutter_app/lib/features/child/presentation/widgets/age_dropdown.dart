import 'package:flutter/material.dart';

class AgeDropdown extends StatelessWidget {
  final int? selectedAge;
  final ValueChanged<int?> onChanged;

  const AgeDropdown({
    super.key,
    required this.selectedAge,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final ages = List.generate(13, (index) => index + 3); // Ages 3–15

    return DropdownButtonFormField<int>(
      initialValue: selectedAge,
      decoration: const InputDecoration(
        labelText: "Age",
        border: OutlineInputBorder(),
      ),
      items: ages
          .map(
            (age) => DropdownMenuItem<int>(
              value: age,
              child: Text("$age years"),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}