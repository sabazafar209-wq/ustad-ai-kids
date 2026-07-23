import 'package:flutter/material.dart';

class InterestsSelector extends StatefulWidget {
  final ValueChanged<List<String>> onSelectionChanged;

  const InterestsSelector({
    super.key,
    required this.onSelectionChanged,
  });

  @override
  State<InterestsSelector> createState() => _InterestsSelectorState();
}

class _InterestsSelectorState extends State<InterestsSelector> {

  final List<String> selected = [];

  final List<Map<String, String>> interests = [
    {"emoji":"🧮","name":"Math"},
    {"emoji":"📚","name":"English"},
    {"emoji":"💻","name":"Coding"},
    {"emoji":"🔬","name":"Science"},
    {"emoji":"🎨","name":"Art"},
    {"emoji":"🤖","name":"AI"},
    {"emoji":"🌍","name":"Geography"},
    {"emoji":"🎵","name":"Music"},
  ];

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Text(
          "Favorite Subjects",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: interests.map((item){

            final value = item["name"]!;
            final selectedChip = selected.contains(value);

            return FilterChip(

              label: Text(
                "${item["emoji"]} $value",
              ),

              selected: selectedChip,

              selectedColor: Theme.of(context)
                  .colorScheme
                  .primaryContainer,

              checkmarkColor: Theme.of(context)
                  .colorScheme
                  .primary,

              onSelected: (checked){

                setState(() {

                  if(checked){
                    selected.add(value);
                  }else{
                    selected.remove(value);
                  }

                });

                widget.onSelectionChanged(selected);

              },

            );

          }).toList(),
        )

      ],
    );

  }

}