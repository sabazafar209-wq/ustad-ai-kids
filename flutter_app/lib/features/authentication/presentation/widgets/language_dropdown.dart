import 'package:flutter/material.dart';

class LanguageDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const LanguageDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  static const languages = [
    "English",
    "Urdu",
    "Japanese",
    "German",
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
     initialValue: value,
      decoration: const InputDecoration(
        labelText: "Preferred Language",
        border: OutlineInputBorder(),
      ),
      items: languages
          .map(
            (language) => DropdownMenuItem(
              value: language,
              child: Text(language),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}