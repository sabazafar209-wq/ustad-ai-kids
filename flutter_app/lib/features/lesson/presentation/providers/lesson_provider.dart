import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/lesson_repository.dart';
import '../../domain/models/lesson_content.dart';

final lessonRepositoryProvider = Provider<LessonRepository>(
  (ref) => LessonRepository(),
);

final lessonProvider = Provider<List<LessonContent>>(
  (ref) {
    return ref.read(lessonRepositoryProvider).getLessons();
  },
);