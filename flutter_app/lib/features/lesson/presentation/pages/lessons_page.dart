import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/lesson_provider.dart';
import '../widgets/lesson_tile.dart';
import 'lesson_page.dart';

class LessonsPage extends ConsumerWidget {
  const LessonsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(lessonProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Today's Lessons"),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];

          return LessonTile(
            lesson: lesson,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => LessonPage(
                    lesson: lesson,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}