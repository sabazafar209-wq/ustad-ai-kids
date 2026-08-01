import 'package:flutter/material.dart';

import '../../domain/models/lesson_content.dart';

class LessonTile extends StatelessWidget {
  final LessonContent lesson;
  final VoidCallback onTap;

  const LessonTile({
    super.key,
    required this.lesson,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.shade100,
          child: Text(
            _emoji(lesson.subject),
            style: const TextStyle(fontSize: 22),
          ),
        ),
        title: Text(
          lesson.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          lesson.description,
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: onTap,
      ),
    );
  }

  String _emoji(String subject) {
    switch (subject) {
      case "Math":
        return "🧮";
      case "English":
        return "📚";
      case "Coding":
        return "💻";
      case "Science":
        return "🔬";
      case "AI":
        return "🤖";
      case "Art":
        return "🎨";
      case "Music":
        return "🎵";
      case "Geography":
        return "🌍";
      default:
        return "📘";
    }
  }
}