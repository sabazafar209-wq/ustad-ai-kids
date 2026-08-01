import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/lesson_content.dart';

class LessonPage extends StatelessWidget {
  final LessonContent lesson;

  const LessonPage({
    super.key,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(lesson.subject),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                _emoji(lesson.subject),
                style: const TextStyle(fontSize: 80),
              ),
            ),

            const SizedBox(height: 24),

            Text(
              lesson.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),

            const SizedBox(height: 12),

            Text(
              lesson.description,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 30),

            Text(
              "Learning Objectives",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 12),

            ...lesson.objectives.map(
              (objective) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(objective),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Card(
              child: ListTile(
                leading: const Icon(Icons.schedule),
                title: const Text("Estimated Duration"),
                trailing: Text("${lesson.duration} min"),
              ),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.play_arrow),
                label: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    "Start Lesson",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                onPressed: () {
                  context.go("/quiz");
                },
              ),
            ),
          ],
        ),
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