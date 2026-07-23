import 'package:flutter/material.dart';

class CountryDropdown extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;

  const CountryDropdown({
    super.key,
    required this.value,
    required this.onChanged,
  });

  static const countries = [
    "Pakistan",
    "Japan",
    "Germany",
    "Spain",
    "United Kingdom",
    "United States",
    "Canada",
  ];

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      initialValue: value,
      decoration: const InputDecoration(
        labelText: "Country",
        border: OutlineInputBorder(),
      ),
      items: countries
          .map(
            (country) => DropdownMenuItem(
              value: country,
              child: Text(country),
            ),
          )
          .toList(),
      onChanged: onChanged,
    );
  }
}