import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  final String emoji;
  final String title;
  final Color color;

  const LessonCard({
    super.key,
    required this.emoji,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color.withValues(alpha: 0.2),
          child: Text(
            emoji,
            style: const TextStyle(fontSize: 24),
          ),
        ),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
        onTap: () {},
      ),
    );
  }
}