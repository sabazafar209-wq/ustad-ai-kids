import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ustad_ai_kids/core/navigation/navigation_helper.dart';
import 'package:ustad_ai_kids/core/navigation/standard_app_bar.dart';

import '../providers/lesson_provider.dart';
import '../widgets/lesson_tile.dart';

class LessonsPage extends ConsumerWidget {
  const LessonsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessons = ref.watch(lessonProvider);

    return Scaffold(
      appBar: const StandardAppBar(
        title: "Today's Lessons",
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: lessons.length,
        itemBuilder: (context, index) {
          final lesson = lessons[index];

          return LessonTile(
            lesson: lesson,
            onTap: () {
              NavigationHelper.push(
                context,
                '/lesson',
                extra: lesson,
              );
            },
          );
        },
      ),
    );
  }
}